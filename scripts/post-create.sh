#!/bin/bash

# Install cloudflared binary directly (no sudo needed)
echo "Installing cloudflared..."
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /opt/hermes/.venv/bin/cloudflared
chmod +x /opt/hermes/.venv/bin/cloudflared

# Set up environment variables
cat << 'ENVEOF' >> /opt/data/.env

# Custom API Configuration
OPENAI_API_BASE=https://openclaw.994938.xyz/v1
OPENAI_API_KEY=sk-KhbSk9pyLHkw8AzPy
LLM_MODEL=openai/gemini-3-flash

# Feishu Configuration
FEISHU_APP_ID=cli_a936f831e0389bc0
FEISHU_APP_SECRET=05o9tqccFrNsPQ5EtnlaL3aphGNVCzPF
ENVEOF

# Add auto-URL print to bashrc
cat << 'BASHRC' >> /home/hermes/.bashrc

# Auto-print Cloudflare Tunnel URL when opening terminal
if [ -f /opt/data/logs/cloudflared.log ]; then
    sleep 2 # 给点时间让隧道分配 URL
    URL=$(grep -oE "https://[a-zA-Z0-9-]+\.trycloudflare\.com" /opt/data/logs/cloudflared.log | tail -1)
    if [ -n "$URL" ]; then
        echo -e "\n======================================================="
        echo -e "🚀 Hermes Agent WebUI 已经启动并穿透外网！"
        echo -e "🌐 你的专属访问链接: \e[1;32m$URL\e[0m"
        echo -e "=======================================================\n"
    fi
fi
BASHRC

echo "Custom configurations and auto-tunnel injected!"
