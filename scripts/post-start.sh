#!/bin/bash
mkdir -p /opt/data/logs

echo "Cleaning up old instances..."
pkill -f "hermes dashboard" || true
pkill -f "cloudflared tunnel" || true

echo "Starting Hermes Dashboard in background..."
nohup hermes dashboard --host 0.0.0.0 --port 9119 > /opt/data/logs/dashboard.log 2>&1 &

echo "Starting Cloudflare Tunnel in background..."
nohup cloudflared tunnel --url http://localhost:9119 > /opt/data/logs/cloudflared.log 2>&1 &
