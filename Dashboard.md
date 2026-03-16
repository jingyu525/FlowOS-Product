# 仪表盘

[[00-Inbox/Inbox|📥 收件箱]] | [[10-Projects/活跃项目看板|📊 项目]] | [[2026-03-16|📅 今日日记]] | [[99-Manual/完整用户手册|📚 帮助]]

## ⚡ 快速操作

- [📝 添加新任务](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&filepath=00-Inbox%2FInbox&commandid=tasks%3Acreate-or-edit)
- [➕ 新建项目](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&filepath=10-Projects%2F%E6%96%B0%E5%BB%BA%E9%A1%B9%E7%9B%AE&template=90-Templates%2F%E9%A1%B9%E7%9B%AE%E6%A8%A1%E7%89%88)
- [📓 写日记](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&daily=true)

## 📌 活跃项目

```dataview
TABLE status as 状态, priority as 优先级
FROM "10-Projects"
WHERE status != "completed" AND file.name != "10-Projects"
```

## 🔥 高优先级任务

```tasks
not done
priority is high
```

## ⚠️ 过期任务

```tasks
not done
due before today
```
