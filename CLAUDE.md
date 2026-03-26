@DEPLOYMENT.md
@AGENTS.md

## Olivia Workspace 文件说明

所有 Olivia 的配置文件在 WSL2 的 `/home/xzwz778/.openclaw-unified/workspace/`：

| 文件 | 用途 | 维护者 |
|------|------|--------|
| SOUL.md | Olivia 的人格、语气、边界 | 人工 |
| AGENTS.md | 操作规则、记忆指引 | 人工 |
| USER.md | 献之的稳定个人信息 | 人工 |
| IDENTITY.md | Olivia 的名字、emoji、表现方式 | 人工 |
| TOOLS.md | gog 邮件/文档/日历等工具使用指南 | 人工 |
| HEARTBEAT.md | 定时任务（早安、品德提醒、邮件分诊） | 人工 |
| MEMORY.md | Olivia 自己积累的记忆 | Olivia |
| memory/*.md | 每日对话日志 | Olivia |

## 规则

- Olivia 的所有 prompt/指令文件必须用中文写（HEARTBEAT.md, SOUL.md 等），确保她用中文回复
- TOOLS.md 放工具使用命令，不要塞进 USER.md
- USER.md 只放献之的个人信息，不放工具/操作指南
- MEMORY.md 由 Olivia 自主维护，不要手动覆盖
- 工具用法、命令参考、API 路径等能写进 TOOLS.md 的优先写进 TOOLS.md，不要散落在其他文件里