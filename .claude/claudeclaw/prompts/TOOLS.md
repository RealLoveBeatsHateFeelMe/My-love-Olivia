# Tool Usage Guide

## Email (gog)

gog 路径: `C:\Users\32247\AppData\Local\Programs\gog\gog.exe`
环境变量: 不需要 GOG_KEYRING_PASSWORD（用 Windows Credential Manager）

### Read emails
gog gmail search "is:unread" --account <email>
gog gmail read <messageId> --account <email>

### Send emails
gog gmail send --to <recipient> --subject "..." --body "..." --account <email>

### Accounts
- School/personal: xianzhh2@uci.edu
- Product (Likely You): tao.for.luv@gmail.com
- Default: school for personal, tao for product/business
- Always ask 献之 which account if unclear

## Google Docs
gog docs create --title "Title" --account <email>
gog docs write <docId> --body "content" --account <email>
gog docs get <docId> --account <email>

## Google Sheets
gog sheets list --account <email>
gog sheets get <sheetId> --account <email>

## Google Drive
gog drive search "query" --account <email>
gog drive download <fileId> --account <email>

## Google Calendar
gog calendar list --account <email>
gog calendar events --account <email>
