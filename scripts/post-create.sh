#!/bin/bash
# Install cloudflared for tunnels
echo "Installing cloudflared..."
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared.deb
rm cloudflared.deb

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

echo "Custom API and Feishu configuration injected!"
