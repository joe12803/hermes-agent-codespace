# Hermes Agent Codespace

🌍 *[Read in English](#english) | [中文说明](#chinese)*

This repository provides a ready-to-use [DevContainer](https://containers.dev/) setup for running [NousResearch's Hermes Agent](https://github.com/NousResearch/hermes-agent) directly in your browser using **GitHub Codespaces**.

本项目提供了一个开箱即用的 DevContainer 配置，让你可以在浏览器中通过 GitHub Codespaces 直接运行 NousResearch 的自主智能体项目 Hermes Agent。

---

<a name="english"></a>
## 🇺🇸 English

### 🚀 Quick Start
1. Click the green **Code** button on this repository.
2. Switch to the **Codespaces** tab.
3. Click **Create codespace on main**.
4. Wait for the container to build. The setup process will automatically install system dependencies, Python 3.11, the `uv` package manager, and clone the latest Hermes Agent source code.

### 🛠️ Usage
Once the Codespace is ready and the terminal says **"🚀 Hermes Agent 已就绪！"**, simply run:
```bash
# 1. Configure your API keys (OpenAI, Anthropic, OpenRouter, etc.)
hermes setup

# 2. Start the interactive agent UI
hermes
```

### 💾 Persistent Storage
All your runtime data, configurations, API keys, memories, and logs are saved in the `/opt/data` directory. This ensures that your agent's state **persists** even if your Codespace stops or restarts.

---

<a name="chinese"></a>
## 🇨🇳 中文说明

### 🚀 快速开始
1. 点击本仓库绿色的 **Code** 按钮。
2. 切换到 **Codespaces** 标签页。
3. 点击 **Create codespace on main**。
4. 等待容器构建完成。安装过程会自动配置系统依赖、Python 3.11 环境、`uv` 包管理器，并克隆最新的 Hermes Agent 源码。

### 🛠️ 使用方法
当 Codespace 准备就绪，且终端显示 **"🚀 Hermes Agent 已就绪！"** 时，直接运行以下命令：
```bash
# 1. 配置你的 API 密钥（OpenAI, Anthropic, OpenRouter 等）
hermes setup

# 2. 启动交互式 Agent 界面
hermes
```

### 💾 数据持久化
所有的运行时数据、配置文件、API 密钥、长期记忆以及日志，都会安全地保存在 `/opt/data` 目录中。这确保了即使你的 Codespace 停止或重启，Agent 的所有状态和进度都**不会丢失**。

---
*Built with [Claude Code](https://claude.com/claude-code).*
