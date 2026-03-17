#!/bin/bash

echo "=== FlowOS 版本回滚 ==="

# 0. 检查是否在 git 仓库中
if [ ! -d ".git" ]; then
    echo "错误：当前目录不是 git 仓库。"
    exit 1
fi

# 1. 列出所有备份标签
echo "最近的 10 个备份点："
# 尝试列出 backup_ 开头的标签，按时间倒序
if git tag -l "backup_*" > /dev/null 2>&1; then
    git tag -l "backup_*" --sort=-creatordate | head -n 10
else
    echo "未找到任何备份标签。"
    exit 1
fi

echo "--------------------------------"

# 2. 选择回滚点
read -p "请输入要回滚到的标签名 (复制上面的名称，直接回车取消): " TAG_NAME

if [ -z "$TAG_NAME" ]; then
    echo "操作已取消。"
    exit 0
fi

# 验证标签是否存在
if ! git rev-parse "$TAG_NAME" >/dev/null 2>&1; then
    echo "错误：标签 '$TAG_NAME' 不存在。"
    exit 1
fi

# 3. 确认
echo "⚠️  警告：正在执行硬重置 (Hard Reset)！"
echo "回滚到 $TAG_NAME 将丢失该时间点之后的所有未提交更改和提交记录。"
read -p "是否确认回滚？(y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "操作已取消。"
    exit 0
fi

# 4. 执行回滚
echo "正在回滚..."
git reset --hard "$TAG_NAME"

if [ $? -eq 0 ]; then
    echo "✅ 回滚成功！当前状态："
    git log -1 --format="%h - %s (%cd)"
else
    echo "❌ 回滚失败。"
fi
