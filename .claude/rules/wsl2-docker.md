---
globs: ["**/docker-compose.yml", "**/DEPLOYMENT.md", "**/*.sh"]
---

# WSL2 Docker 命令规则（关键）

## 绝对不要用 `newgrp docker <<<`

`newgrp docker <<< 'command'` 在 WSL2 环境下会：
1. 创建一个临时 shell session
2. 执行完命令后 session 退出
3. 退出时向子进程发送 SIGTERM
4. **如果子进程是 Docker 容器，容器会被杀掉**

这会导致容器反复重启的死循环。

## 正确做法

用 `sudo docker` 替代 `newgrp docker`：

```bash
# 错误 ❌
wsl -d Ubuntu -- bash -c "newgrp docker <<< 'docker compose up -d 2>&1'"

# 正确 ✅
wsl -d Ubuntu -- bash -c "sudo docker compose up -d 2>&1"

# 正确 ✅
wsl -d Ubuntu -- bash -c "sudo docker ps 2>&1"

# 正确 ✅
wsl -d Ubuntu -- bash -c "sudo docker logs --tail 10 container-name 2>&1"
```

## Docker Compose 命令必须在项目目录执行

```bash
wsl -d Ubuntu -- bash -c "cd /home/xzwz778/openclaw-unified && sudo docker compose up -d 2>&1"
```

## 重启容器的安全方式

```bash
# 安全重启（不会丢端口映射）
wsl -d Ubuntu -- bash -c "cd /home/xzwz778/openclaw-unified && sudo docker compose restart openclaw-gateway 2>&1"

# 完全重建（换 .env 后必须用这个）
wsl -d Ubuntu -- bash -c "cd /home/xzwz778/openclaw-unified && sudo docker compose down && sudo docker compose up -d openclaw-gateway 2>&1"
```
