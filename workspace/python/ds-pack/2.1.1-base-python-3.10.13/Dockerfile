FROM python:3.10.13-slim-bookworm

# Set shell to be bash and fail any pipe if any step in the pipe fails
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# install system packages
RUN apt-get update \
    # Installation requirements
    && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    curl \
    gnupg2 \
    # Set up Docker repository
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' \
    && add-apt-repository 'deb http://cloud.r-project.org/bin/linux/debian bookworm-cran40/' \
    # node
    && curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    # install system packages
    # jq is needed for the Peak Platform
    jq \
    nano \
    vim \
    fish \
    zsh \
    r-base=4.2.2.20221110-2 \
    r-recommended=4.2.2.20221110-2 \
    build-essential \
    sudo \
    nodejs \
    git \
    htop \
    pandoc \
    texlive \
    texlive-science \
    texlive-latex-extra \
    texlive-luatex \
    texlive-xetex \
    texlive-pictures \
    latexmk \
    lmodern \
    docker-ce \
    less \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libfreetype6 \
    libxi6 \
    openssl \
    unzip \
    libpq-dev \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python3-openssl \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI v2
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.7.4.zip" -o "awscliv2.zip" \
    && unzip -q awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

# Install pyenv globally
RUN curl https://pyenv.run | bash \
    && mkdir -p /usr/local/pyenv \
    && mv /root/.pyenv/* /usr/local/pyenv \
    && rm -rf /root/.pyenv \
    && echo 'export PYENV_ROOT="/usr/local/pyenv"' >> /etc/profile.d/pyenv.sh \
    && echo 'export PATH="/usr/local/pyenv/bin:$PATH"' >> /etc/profile.d/pyenv.sh \
    && echo 'eval "$(pyenv init --path)"' >> /etc/profile.d/pyenv.sh \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> /etc/profile.d/pyenv.sh \
    && chmod -R 777 /usr/local/pyenv

# Ensure pyenv is available to all users
ENV PYENV_ROOT=/usr/local/pyenv
ENV PATH="/usr/local/pyenv/bin:$PATH"

# Needed for JupyterHub
RUN npm install -g configurable-http-proxy \
    && rm -rf ~/.npm

# Install Python packages
COPY requirements.txt /tmp/requirements.txt

RUN pip install --no-cache-dir --upgrade \
    pip \
    setuptools \
    wheel \
    && pip install -r /tmp/requirements.txt

# SPARK: copy over spark config
COPY ./spark /usr/local/spark

# VS Code
COPY codeserver-proxy codeserver-proxy
RUN curl -fsSL https://code-server.dev/install.sh \
    | sh -s -- --version 4.16.1 \
    && pip install --no-cache-dir ./codeserver-proxy

# VS Code CLI
RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz \
    && tar -xf vscode_cli.tar.gz \
    && cp ./code /usr/local/bin \
    && rm -rf vscode_cli.tar.gz

COPY vscode-tunnel vscode-tunnel

RUN mkdir /vscode-tunnel/logs \
    && mkdir /vscode-tunnel/docs \
    && chmod -R 777 vscode-tunnel

RUN cp vscode-tunnel/scripts/start.sh /usr/bin/start-tunnel \
    && cp vscode-tunnel/scripts/stop.sh /usr/bin/stop-tunnel \
    && cp vscode-tunnel/scripts/refresh.sh /usr/bin/restart-tunnel \
    && cp vscode-tunnel/scripts/status.sh /usr/bin/tunnel-status \
    && chmod +x /usr/bin/start-tunnel /usr/bin/stop-tunnel /usr/bin/restart-tunnel /usr/bin/tunnel-status

COPY TUNNELING.md /vscode-tunnel/docs/README.md
    
RUN git config --global credential.helper store \
    && git config --global core.filemode false

# Install Projector & PyCharm Community
COPY projector-proxy projector-proxy
RUN pip install --no-cache-dir projector-installer==1.7.0 --upgrade \
    && projector --accept-license --config-directory /usr/local/share/projector \
    ide autoinstall --config-name pycharm --ide-name "PyCharm Community Edition 2021.3.1" \
    && chmod -R a=rwx /usr/local/share/projector \
    && pip install --no-cache-dir ./projector-proxy

# Force shell to bash as Peak Platform isn't respecting jupyterhub option
RUN ln -sf /bin/bash /bin/sh

# Expose port and set the default command
EXPOSE 8000
CMD ["jupyterhub", \
    "--Spawner.default_url=/lab", \
    "--Spawner.http_timeout=90", \
    "--NotebookApp.terminado_settings={'shell_command':'[/bin/bash]'}" \
    ]
