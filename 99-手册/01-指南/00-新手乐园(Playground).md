---
status: active
test_score: 0
---

# 🎡 新手乐园 (Playground)

> [!info] 欢迎来到新手乐园！
> 这里是你的“沙盒”，你可以随意修改、打勾、删除，不用担心弄坏任何东西。
> 请依次完成下面的挑战，掌握系统的核心功能吧！

---

## 🎯 挑战 1：完成你的第一个任务
这是一个复选框。试着点击它！
- [ ] 我已经学会了如何打勾！✅

---

## 📅 挑战 2：使用 Tasks 语法设置日期
使用 Tasks 插件可以方便地追踪任务状态。
试试给下面的任务加上今天的日期 (输入 `📅 202X-XX-XX` 或者 `📅 today`)，看看它会不会出现在下方的“今日任务”视图中！

- [ ] 这是一个测试任务，请在末尾加上今天的日期 👉 📅 2026-03-17

> [!abstract] 动态视图：今日任务
> 下方的代码块会自动捕获今天到期的任务。如果你在上面加上了今天的日期，它就会出现在这里！
> ```tasks
> not done
> due today
> path includes 00-新手乐园
> ```

---

## 🔺 挑战 3：调整优先级
你可以使用特定的符号来标记任务优先级：`🔺`(高), `🔼`(中), `🔽`(低)。
请在下面的任务末尾加上一个高优先级符号 `🔺`！

- [ ] 这是一个极其重要的任务 👉 🔺

> [!abstract] 动态视图：高优先级任务
> ```tasks
> not done
> priority is high
> path includes 00-新手乐园
> ```

---

## 📊 挑战 4：认识 Dataview
Dataview 可以像数据库一样查询你的笔记。这只是一个演示：
下面展示了你目前所有的“未完成项目”。如果你通过项目模版新建了项目，它会自动出现在这里！

```dataview
TABLE status as "状态", priority as "优先级"
FROM "10-项目"
WHERE status = "active" OR status = "pending"
```

---

## 🧙‍♂️ 挑战 5：神奇的属性面板 (Properties)
在当前这篇笔记的**最上方**，有一个叫做“属性 (Properties)”的区域。这是控制笔记状态的“开关”。
请尝试：将顶部的 `status` 属性的值从 `pending` 修改为 `active`。

> [!abstract] 动态视图：状态监测
> 当你把上面的 `status` 改为 `active` 时，下面这行字会自动发生变化！
> ```dataview
> TABLE WITHOUT ID
>   choice(status = "active", "🎉 太棒了！你成功激活了这个状态！", "⏳ 等待中：请去顶部将 status 改为 active") AS "当前状态反馈"
> WHERE file.name = "00-新手乐园(Playground)"
> ```

---

> [!success] 🎉 恭喜过关！
> 你已经掌握了最核心的用法！
> 现在，你可以前往 [[Dashboard|📊 仪表盘]] 开始你的效率之旅，或者去 [[00-收集箱/Inbox|📥 收集箱]] 记录你的第一个灵感。
> (如果你不再需要这个乐园，随时可以将其删除以保持系统整洁)
