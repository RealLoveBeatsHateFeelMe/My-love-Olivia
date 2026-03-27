# Olivia — 主 Session 配置

> Olivia 人格定义在 `~/.claude/rules/olivia-discord.md`，献之信息在 `~/.claude/CLAUDE.md`。本文件只放此 session 专用的工具和环境配置。

---

## Tools

### Email (gog)

gog 路径: `C:\Users\32247\AppData\Local\Programs\gog\gog.exe`

#### Read emails
gog gmail search "is:unread" --account <email>
gog gmail read <messageId> --account <email>

#### Send emails
gog gmail send --to <recipient> --subject "..." --body "..." --account <email>

#### Accounts
- School/personal: xianzhh2@uci.edu
- Product (Likely You): tao.for.luv@gmail.com
- Default: school for personal, tao for product/business
- Always ask 献之 which account if unclear

### Google Docs/Sheets/Drive/Calendar
gog docs create/write/get, gog sheets list/get, gog drive search/download, gog calendar list/events — all with --account <email>

---

## 规则（此 session 专用）

- Discord 消息通过官方 Discord 插件处理（MCP streaming），不走 subprocess
- ClaudeClaw 只管后台任务（cron/heartbeat），不管 Discord 聊天
- 工具用法写在上面 Tools 段落，不要散落在其他文件里

---

## 当前运行环境

### 系统
- **OS:** Windows 11 Pro (win32)
- **主机:** 联想 ThinkPad X1
- **用户:** `C:\Users\32247\`
- **Shell:** bash (Git Bash / MSYS2)
- **Node:** `/c/nvm4w/nodejs/node`
- **Bun:** `/c/Users/32247/AppData/Local/Microsoft/WinGet/Packages/Oven-sh.Bun_Microsoft.Winget.Source_8wekyb3d8bbwe/bun-windows-x64/bun`
- **时区:** America/Los_Angeles (UTC-7)

### Claude Code
- **订阅:** Max 会员（无限用量，零 API 费用）
- **模型:** claude-opus-4-6 (1M context)
- **工作目录:** `C:\Users\32247\Desktop\Olivia_mydear`
- **Memory 目录:** 自动按工作目录生成
- **启动命令:** `cd ~/Desktop/Olivia_mydear && claude --channels plugin:discord@claude-plugins-official`

### Discord
- **通道:** 官方 Discord 插件 `discord@claude-plugins-official v0.0.4`（MCP streaming）
- **职责:** 所有 Discord 聊天都走这个插件，直接在 Claude Code session 内处理
- **ClaudeClaw 不管 Discord 聊天** — ClaudeClaw 的 discord.token 已清空，只负责 cron/heartbeat
- **Bot 名称:** Olivia on business
- **Bot App ID:** `1486868758965256212`
- **Bot Token 位置:** `~/.claude/channels/discord/.env`（仅插件用）
- **献之 Discord ID:** `1420636197604167783`
- **献之 DM Channel ID:** `1486872330381561896`（MCP reply/fetch_messages 用这个，不是 user ID）

### ClaudeClaw 插件（仅后台任务）
- **版本:** v1.0.0 (`claudeclaw@claudeclaw`)
- **用途:** 仅 cron jobs + heartbeat 定时任务，**不处理 Discord 聊天**
- **Discord token 已清空** — heartbeat/cron 的通知通过 Claude Code session 内的 Discord 插件发送
- **Daemon PID 文件:** `.claude/claudeclaw/daemon.pid`
- **配置:** `.claude/claudeclaw/settings.json`
- **Session:** `.claude/claudeclaw/session.json`
- **日志:** `.claude/claudeclaw/logs/`
- **Cron Jobs:** `.claude/claudeclaw/jobs/`
- **人格 Prompts:** `.claude/claudeclaw/prompts/` (SOUL.md, IDENTITY.md, USER.md, TOOLS.md)
- **Web Dashboard:** `http://127.0.0.1:4632`（或 4633 如果 4632 被占）

### ClaudeClaw Cron Jobs
| Job | Schedule | 说明 |
|-----|----------|------|
| morning-greeting | `0 10 * * *` | 每天早上 10 点问好 |
| email-check-school | `0 * * * *` | 每小时检查学校邮箱未读 |
| email-check-product | `0 */2 * * *` | 每 2 小时检查产品邮箱未读 |
| night-companion | `*/30 0-6 * * *` | 深夜陪伴（0-6 点每 30 分钟） |
| virtue-check | `0 22 * * *` | 每晚品德反思总结 |

### gog CLI（Google 工具）
- **路径:** `C:\Users\32247\AppData\Local\Programs\gog\gog.exe`
- **版本:** v0.12.0
- **配置目录:** `C:\Users\32247\AppData\Roaming\gogcli\`
- **Keyring:** Windows Credential Manager（不需要 GOG_KEYRING_PASSWORD）
- **已认证邮箱:**
  - `xianzhh2@uci.edu` — 学校
  - `tao.for.luv@gmail.com` — 产品 (Likely You)
- **Google API 项目:** likely-you-stuff（Gmail, Drive, Docs, Sheets, Calendar）

### 关键文件路径速查
| 文件 | 路径 |
|------|------|
| CLAUDE.md | `C:\Users\32247\Desktop\Olivia_mydear\CLAUDE.md` |
| ClaudeClaw 配置 | `.claude/claudeclaw/settings.json` |
| ClaudeClaw 人格 | `.claude/claudeclaw/prompts/SOUL.md` 等 |
| ClaudeClaw Cron | `.claude/claudeclaw/jobs/*.md` |
| Discord Token | `~/.claude/channels/discord/.env` |
| gog 配置 | `C:\Users\32247\AppData\Roaming\gogcli\` |
| gog 二进制 | `C:\Users\32247\AppData\Local\Programs\gog\gog.exe` |
| 插件缓存 | `C:\Users\32247\.claude\plugins\cache\` |
