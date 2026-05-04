#!/bin/bash
export PATH="/opt/hermes/.venv/bin:$PATH"

mkdir -p /opt/data/logs

echo "Cleaning up old instances..."
pkill -f "hermes dashboard" || true
pkill -f "cloudflared tunnel" || true

echo "Starting Hermes Dashboard in background..."
# 必须加 --insecure 才能绑定 0.0.0.0，否则会被拒绝！
nohup hermes dashboard --host 0.0.0.0 --port 9119 --insecure > /opt/data/logs/dashboard.log 2>&1 &

echo "Starting Cloudflare Tunnel in background..."
nohup cloudflared tunnel --url http://127.0.0.1:9119 > /opt/data/logs/cloudflared.log 2>&1 &
