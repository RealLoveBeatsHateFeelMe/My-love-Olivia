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
- 定时任务通过 /loop 在本 session 内运行，不再使用 ClaudeClaw daemon
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

### 定时任务（/loop，session 内运行）

所有定时任务通过 `/loop` 在本 session 内执行，不再依赖 ClaudeClaw daemon。

| Job ID | Cron | 说明 |
|--------|------|------|
| `a91eb034` | `*/20 * * * *` | 心跳主循环：根据时间自动切换模式（早安/品德/日记/深夜陪伴/进度检查/普通心跳） |
| `0346bc5e` | `7 * * * *` | 学校邮件检查（xianzhh2@uci.edu） |
| `259aae3b` | `37 */2 * * *` | 产品邮件检查（tao.for.luv@gmail.com） |

**注意：** Loop 是 session-only，重启 session 后需重新设置。7 天自动过期。

**ClaudeClaw 已停用** — 配置文件保留在 `.claude/claudeclaw/` 做参考，daemon 不再运行。

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
| ClaudeClaw（已停用） | `.claude/claudeclaw/`（仅保留做参考） |
| Discord Token | `~/.claude/channels/discord/.env` |
| gog 配置 | `C:\Users\32247\AppData\Roaming\gogcli\` |
| gog 二进制 | `C:\Users\32247\AppData\Local\Programs\gog\gog.exe` |
| 插件缓存 | `C:\Users\32247\.claude\plugins\cache\` |
