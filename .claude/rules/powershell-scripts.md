---
globs: ["**/*.ps1", "**/Scripts/**"]
---

# PowerShell 脚本规则

## 编码问题（关键）
- PowerShell 脚本中**绝对不要**在字符串字面量里直接写中文
- 中文会因为编码问题（UTF-8 vs Windows 默认编码）导致字符串解析失败
- 解决方案：prompt 用英文写，让 LLM 自己翻译成中文回复
- 如果必须用中文，确保文件以 UTF-8 with BOM 保存

## HTTP Body 编码
- 发送 JSON body 时，先用 `[System.Text.Encoding]::UTF8.GetBytes($body)` 转为 UTF-8 字节
- Content-Type 必须带 charset：`"application/json; charset=utf-8"`
- 不要用 `-Compress` 参数，用 `-Depth 3`

## 长字符串
- 用 here-string `@" ... "@` 替代单行长字符串
- 变量插值在 here-string 里正常工作

## 模板
```powershell
$msg = @"
English prompt here, let LLM respond in Chinese.
Variable interpolation: $variable works here.
"@

$body = @{
    message = $msg
    name = "TaskName"
    channel = "discord"
    deliver = $true
    model = "anthropic/claude-haiku-4-5"
} | ConvertTo-Json -Depth 3

$utf8Body = [System.Text.Encoding]::UTF8.GetBytes($body)

Invoke-RestMethod -Uri $uri -Method POST -Body $utf8Body `
    -ContentType "application/json; charset=utf-8" `
    -Headers @{ "Authorization" = "Bearer $token" } `
    -TimeoutSec 30
```
