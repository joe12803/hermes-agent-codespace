# Hermes Agent Codespace

This repository provides a ready-to-use [DevContainer](https://containers.dev/) setup for running [NousResearch's Hermes Agent](https://github.com/NousResearch/hermes-agent) directly in your browser using **GitHub Codespaces**.

## 🚀 Quick Start

1. Click the green **Code** button on this repository.
2. Switch to the **Codespaces** tab.
3. Click **Create codespace on main**.
4. Wait for the container to build. The setup process will automatically install system dependencies, Python 3.11, the `uv` package manager, and clone the latest Hermes Agent source code.

## 🛠️ Usage

Once the Codespace is ready and the terminal says **"🚀 Hermes Agent 已就绪！"**, simply run:

```bash
# 1. Configure your API keys (OpenAI, Anthropic, OpenRouter, etc.)
hermes setup

# 2. Start the interactive agent UI
hermes
```

## 💾 Persistent Storage

All your runtime data, configurations, API keys, memories, and logs are saved in the `/opt/data` directory. This ensures that your agent's state **persists** even if your Codespace stops or restarts.

---
*Built with [Claude Code](https://claude.com/claude-code).*
