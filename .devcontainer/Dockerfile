FROM node:24.21-trixie-slim

WORKDIR /workspace
ARG PNPM_VERSION=12.5.1
ENV PYTHONUNBUFFERED=1
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
ENV TERM=xterm-256color
ENV COLORTERM=truecolor
ENV SHELL=/bin/zsh
ENV NEXT_TELEMETRY_DISABLED=1
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0

RUN apt-get update \
    && apt-get install -y \
        git \
        ca-certificates \
        zsh \
        vim \
        make \
        locales \
        --no-install-recommends \
    && update-ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && sed -i '/ja_JP.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen \
    && useradd -m appuser

RUN corepack enable && corepack prepare pnpm@${PNPM_VERSION} --activate

COPY --chown=appuser:appuser .zshrc /home/appuser/.zshrc

# Cursor MCP設定をコピー
RUN mkdir -p /home/appuser/.cursor
COPY --chown=appuser:appuser mcp.json /home/appuser/.cursor/mcp.json

RUN usermod -s /bin/zsh appuser
USER appuser

# zsh-autosuggestions v0.7.1
RUN git clone --depth 1 --branch v0.7.1 https://github.com/zsh-users/zsh-autosuggestions.git /home/appuser/.zsh/zsh-autosuggestions

CMD ["sleep", "infinity"]
