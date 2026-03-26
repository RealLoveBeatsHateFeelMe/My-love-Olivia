# Tool Usage Guide

## Email (gog)

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
