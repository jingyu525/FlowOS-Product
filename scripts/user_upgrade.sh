#!/bin/bash

# Configuration
UPSTREAM="upstream"
BRANCH="main"

echo "=== 开始升级产品 ==="

# 1. 确保本地工作区干净
if [ -n "$(git status --porcelain)" ]; then
    echo "错误：工作区不干净，请先备份或提交变更。"
    exit 1
fi

# 2. 获取上游更新
echo "获取产品更新..."
git fetch "$UPSTREAM"

# 3. 合并更新
echo "合并更新到本地..."
git merge "$UPSTREAM/$BRANCH"

# 4. 如果有冲突，提示解决
if [ $? -ne 0 ]; then
    echo "警告：存在合并冲突。请手动解决冲突后运行 user_backup.sh 提交。"
else
    echo "升级成功！"
fi

echo "=== 升级流程结束 ==="
