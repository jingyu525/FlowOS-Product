#!/bin/bash

# Rename folders from v1.0 (English) to v1.1 (Chinese)

# Check if old folders exist and rename them
if [ -d "00-Inbox" ]; then
    echo "Renaming 00-Inbox to 00-收集箱..."
    git mv "00-Inbox" "00-收集箱"
fi

if [ -d "05-Daily" ]; then
    echo "Renaming 05-Daily to 05-日记..."
    git mv "05-Daily" "05-日记"
fi

if [ -d "10-Projects" ]; then
    echo "Renaming 10-Projects to 10-项目..."
    git mv "10-Projects" "10-项目"
fi

if [ -d "20-Areas" ]; then
    echo "Renaming 20-Areas to 20-领域..."
    git mv "20-Areas" "20-领域"
fi

if [ -d "30-Resources" ]; then
    echo "Renaming 30-Resources to 30-资源..."
    git mv "30-Resources" "30-资源"
fi

if [ -d "40-Archives" ]; then
    echo "Renaming 40-Archives to 40-归档..."
    git mv "40-Archives" "40-归档"
fi

if [ -d "90-Templates" ]; then
    echo "Renaming 90-Templates to 90-模版..."
    git mv "90-Templates" "90-模版"
fi

if [ -d "99-Manual" ]; then
    echo "Renaming 99-Manual to 99-手册..."
    git mv "99-Manual" "99-手册"
fi
