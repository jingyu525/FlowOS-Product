#!/bin/bash

# Configuration
# 默认推送到 origin (用户私有数据仓库)
REMOTE="origin"
BRANCH="main"

echo "=== 开始备份数据 ==="

# 1. 添加所有变更
git add .

# 2. 提交变更
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "Backup: $TIMESTAMP"

# 3. 推送到远程仓库
echo "推送到 $REMOTE..."
git push "$REMOTE" "$BRANCH"

echo "=== 备份完成 ==="
