#!/bin/bash
export PATH="/opt/hermes/.venv/bin:$PATH"

# Install cloudflared binary directly
echo "Installing cloudflared..."
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /opt/hermes/.venv/bin/cloudflared
chmod +x /opt/hermes/.venv/bin/cloudflared

# Set up environment variables
cat << 'ENVEOF' >> /opt/data/.env

# Custom API Configuration
OPENAI_BASE_URL=https://openclaw.994938.xyz/v1
OPENAI_API_KEY=sk-KhbSk9pyLHkw8AzPy
LLM_MODEL=openai/gemini-3-flash

# Feishu Configuration
FEISHU_APP_ID=cli_a936f831e0389bc0
FEISHU_APP_SECRET=05o9tqccFrNsPQ5EtnlaL3aphGNVCzPF
# Telegram Configuration
TELEGRAM_BOT_TOKEN=8663293275:AAHOsfeSCs38BxbCxpJjQOVO_MHXqSQtJiU
TELEGRAM_ALLOWED_USERS=5145338625
TELEGRAM_HOME_CHANNEL=5145338625
TELEGRAM_HOME_CHANNEL_NAME=Admin
ENVEOF

# Add helper to bashrc
cat << 'BASHRC' >> /home/hermes/.bashrc

alias logs="tail -f /opt/data/logs/dashboard.log"
alias cflogs="tail -f /opt/data/logs/cloudflared.log"

function webui() {
    echo "正在获取 Cloudflare Tunnel 链接..."
    for i in {1..10}; do
        URL=$(grep -oE "https://[a-zA-Z0-9-]+\.trycloudflare\.com" /opt/data/logs/cloudflared.log 2>/dev/null | tail -1)
        if [ -n "$URL" ]; then
            echo -e "\n======================================================="
            echo -e "🚀 Hermes Agent WebUI 穿透成功！"
            echo -e "🌐 点击访问: \e[1;32m$URL\e[0m"
            echo -e "=======================================================\n"
            return 0
        fi
        sleep 1
    done
    echo "仍在生成中，请稍后输入 'webui' 命令再次查看。"
}

# 自动在后台获取 URL
webui &
BASHRC
