#!/usr/bin/env bash
# check-awake.sh — 检测献之是否在睡觉
# 输出: awake / sleeping / unknown
# 扫描所有 session 日志，找最后一条真实用户消息

SESSIONS_DIR="/home/node/.openclaw/agents/main/sessions"

LAST_USER_TS=$(python3 -c "
import json, glob, os

sessions_dir = '$SESSIONS_DIR'
last_ts = 0

for f in glob.glob(os.path.join(sessions_dir, '*.jsonl')):
    with open(f) as fh:
        for line in fh:
            try:
                entry = json.loads(line.strip())
                msg = entry.get('message', {})
                if msg.get('role') != 'user':
                    continue
                content = msg.get('content', [])
                text = ''
                if isinstance(content, list):
                    for c in content:
                        if isinstance(c, dict) and c.get('type') == 'text':
                            text += c.get('text', '')
                elif isinstance(content, str):
                    text = content
                # 排除 heartbeat 系统消息
                if 'Read HEARTBEAT.md' in text:
                    continue
                # 排除非真实用户消息
                if 'sender_id' not in text:
                    continue
                ts = msg.get('timestamp', 0)
                if ts > last_ts:
                    last_ts = ts
            except:
                continue

print(int(last_ts))
" 2>/dev/null)

if [ -z "$LAST_USER_TS" ] || [ "$LAST_USER_TS" = "0" ]; then
  echo "unknown"
  exit 0
fi

NOW_MS=$(python3 -c "import time; print(int(time.time()*1000))")
DIFF_MS=$((NOW_MS - LAST_USER_TS))
DIFF_MIN=$((DIFF_MS / 60000))

# 当前小时 (America/Los_Angeles)
HOUR=$(TZ="America/Los_Angeles" date +%H 2>/dev/null | sed 's/^0//')

# 判断:
# - 最后消息在 30 分钟内 → awake
# - 0:00-11:00 且最后消息超过 60 分钟 → sleeping
# - 其他 → unknown
if [ "$DIFF_MIN" -le 30 ]; then
  echo "awake"
elif [ "$HOUR" -ge 0 ] && [ "$HOUR" -lt 11 ] && [ "$DIFF_MIN" -gt 60 ]; then
  echo "sleeping"
else
  echo "unknown"
fi
