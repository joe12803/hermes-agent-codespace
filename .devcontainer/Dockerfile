FROM debian:13.4

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# 安装系统依赖（匹配 hermes-agent 官方 Dockerfile 的要求）
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    ca-certificates \
    nodejs \
    npm \
    python3 \
    python3-dev \
    python3-pip \
    python3-venv \
    ripgrep \
    ffmpeg \
    gcc \
    libffi-dev \
    procps \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# 安装 uv（快速 Python 包管理器）
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
COPY --from=ghcr.io/astral-sh/uv:latest /uvx /usr/local/bin/uvx

# 创建非 root 用户（匹配 hermes-agent 惯例）
RUN useradd -m -u 10000 -s /bin/bash hermes && \
    mkdir -p /opt/hermes /opt/data && \
    chown hermes:hermes /opt/hermes /opt/data

WORKDIR /opt/hermes

# 克隆并安装 hermes-agent
RUN git clone --depth 1 https://github.com/NousResearch/hermes-agent.git /opt/hermes && \
    uv venv .venv --python 3.11 && \
    uv pip install -e ".[all]" && \
    chown -R hermes:hermes /opt/hermes

# 创建持久化数据目录结构（匹配 entrypoint.sh 中的目录）
RUN mkdir -p /opt/data/{cron,sessions,logs,hooks,memories,skills,skins,plans,workspace,home} && \
    chown -R hermes:hermes /opt/data

USER hermes

ENV PATH="/opt/hermes/.venv/bin:${PATH}"
ENV HERMES_HOME=/opt/hermes
ENV HERMES_DATA=/opt/data
