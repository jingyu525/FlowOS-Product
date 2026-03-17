# 仪表盘

![Banner](30-资源/图片/Dashboard-Banner.jpeg)

[[00-收集箱/Inbox|📥 收件箱]] | [[10-项目/活跃项目看板|📊 项目]] | [[05-日记|📅 日记列表]] | [[99-手册/02-参考手册/完整用户手册|📚 帮助]]

## ⚡ 快速操作

- [📝 添加新任务](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&filepath=00-收集箱%2FInbox&commandid=tasks%3Acreate-or-edit)
- [➕ 新建项目](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&filepath=10-项目%2F%E6%96%B0%E5%BB%BA%E9%A1%B9%E7%9B%AE&template=90-模版%2F%E9%A1%B9%E7%9B%AE%E6%A8%A1%E7%89%88)
- [📓 写日记](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&daily=true)

## 📌 活跃项目

```dataview
TABLE status as 状态, priority as 优先级
FROM "10-项目"
WHERE status != "completed" AND file.name != "10-项目"
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
