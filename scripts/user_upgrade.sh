#!/bin/bash

# Configuration
UPSTREAM="upstream"
BRANCH="main"

# Function to get current timestamp
get_timestamp() {
    date +"%Y%m%d_%H%M%S"
}

echo "=== 开始 FlowOS 升级 ==="

# 0. 检查是否在 git 仓库中
if [ ! -d ".git" ]; then
    echo "错误：当前目录不是 git 仓库。请确保在 FlowOS 根目录下运行。"
    exit 1
fi

# 1. 确保本地工作区干净
if [ -n "$(git status --porcelain)" ]; then
    echo "错误：工作区不干净，请先备份或提交变更（运行 scripts/user_backup.sh）。"
    exit 1
fi

# 2. 创建升级前备份标签
BACKUP_TAG="backup_before_upgrade_$(get_timestamp)"
echo "正在创建备份标签: $BACKUP_TAG"
git tag "$BACKUP_TAG"
if [ $? -ne 0 ]; then
    echo "错误：创建备份标签失败。"
    exit 1
fi

# 3. 运行迁移脚本 (如果有)
echo "检查并运行迁移脚本..."
if [ -d "scripts/migrations" ]; then
    for migration_script in scripts/migrations/*.sh; do
        if [ -f "$migration_script" ]; then
            echo "正在运行迁移脚本: $migration_script"
            bash "$migration_script"
            if [ $? -ne 0 ]; then
                echo "错误：迁移脚本执行失败。正在回滚..."
                git reset --hard "$BACKUP_TAG"
                git tag -d "$BACKUP_TAG"
                exit 1
            fi
            # 如果迁移脚本修改了文件，需要提交
            if [ -n "$(git status --porcelain)" ]; then
                git add .
                git commit -m "Apply migration: $(basename "$migration_script")"
            fi
        fi
    done
fi

# 4. 获取上游更新
echo "正在获取最新版本信息..."
git fetch "$UPSTREAM"
if [ $? -ne 0 ]; then
    echo "错误：无法连接到更新服务器。请检查网络连接。"
    # 如果没有做任何更改，删除备份标签
    # 但是如果是迁移脚本做了更改，保留标签比较好？
    # 这里简单处理：如果 fetch 失败，且没有迁移更改，删除标签。
    # 但如果有迁移更改，用户可能想保留。
    # 暂时不自动删除标签，用户可以手动回滚。
    exit 1
fi

# 5. 显示更新预览
echo "=== 更新预览 ==="
git diff --stat HEAD.."$UPSTREAM/$BRANCH"
echo "=================="

# 6. 确认升级
read -p "是否确认进行升级？(y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "升级已取消。"
    # 如果迁移脚本做了更改，这里可能需要回滚？
    # 假设用户取消升级，可能也想撤销迁移。
    # 但迁移通常是本地数据结构的调整，为了兼容新版。
    # 如果不升级，旧版可能不兼容新结构。
    # 询问是否回滚迁移
    read -p "是否回滚迁移更改？(y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git reset --hard "$BACKUP_TAG"
        echo "已回滚到升级前状态。"
    fi
    exit 0
fi

# 7. 合并更新
echo "正在合并更新..."
git merge "$UPSTREAM/$BRANCH"

# 8. 处理结果
if [ $? -ne 0 ]; then
    echo "⚠️  警告：存在合并冲突。"
    echo "请手动解决冲突：打开冲突文件，选择保留的内容。"
    echo "解决冲突后，请运行 scripts/user_backup.sh 完成升级提交。"
else
    echo "✅ 升级成功！"
fi

echo "=== 升级流程结束 ==="
