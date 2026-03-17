# 📊 仪表盘 (Dashboard)

> [!abstract] 核心导航 (Navigation)
> [[99-手册/01-指南/00-开始使用|🚀 开始页面]] | [[00-收集箱/Inbox|📥 收集箱]] | [[10-项目/活跃项目看板|📊 项目看板]] | [[05-日记|📅 日记列表]] | [[00-新手乐园(Playground)|🎡 新手乐园]]

---

## ⚡ 快速操作 (Quick Actions)
> [!example] 点击下方链接快速创建内容
> - 📝 [添加新任务到收集箱](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&filepath=00-收集箱%2FInbox&commandid=tasks%3Acreate-or-edit)
> - ➕ [新建项目](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&filepath=10-项目%2F%E6%96%B0%E5%BB%BA%E9%A1%B9%E7%9B%AE&template=90-模版%2F%E9%A1%B9%E7%9B%AE%E6%A8%A1%E7%89%88)
> - 📓 [写今日日记](obsidian://advanced-uri?vault=%E4%BB%BB%E5%8A%A1%E7%AE%A1%E7%90%86&daily=true)

---

## 🎯 今日聚焦 (Focus)

### 🔥 高优先级任务
```tasks
not done
priority is high
```

### ⚠️ 即将过期
```tasks
not done
due before tomorrow
```

---

## 📌 活跃项目 (Active Projects)
> [!info] 正在进行中的项目
```dataview
TABLE status as "状态", priority as "优先级"
FROM "10-项目"
WHERE status != "done" AND status != "completed" AND status != "archived" AND file.name != "10-项目" AND file.name != "活跃项目看板" AND file.name != "新建项目" AND file.name != "项目列表"
```
