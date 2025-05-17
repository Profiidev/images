FROM debian:bookworm

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    git \
    jq \
    locales \
    sudo \
    fish \
    wget \
    nano \
  && rm -rf /var/lib/apt/lists/*

# Install Starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y
# Install fastfetch
RUN wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.43.0/fastfetch-linux-amd64.deb && \
    dpkg -i fastfetch-linux-amd64.deb && \
    rm fastfetch-linux-amd64.deb

# Generate the desired locale (en_US.UTF-8)
RUN locale-gen en_US.UTF-8

# Make typing unicode characters in the terminal work.
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

ENV PATH="/home/coder/.local/bin:$PATH"
ENV SHELL="/usr/bin/fish"

# add a `coder` user so that you're not developing as the `root` user
RUN useradd coder \
    --create-home \
    --shell=/usr/bin/fish \
    --uid=1000 \
    --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

USER coder
WORKDIR /home/coder

# Configs
RUN mkdir -p /home/coder/.config/fish && \
    mkdir -p /home/coder/.config/fastfetch

COPY coder/reveal-js/config.fish /home/coder/.config/fish/config.fish
COPY coder/reveal-js/starship.toml /home/coder/.config/starship.toml
COPY coder/reveal-js/fastfetch.jsonc /home/coder/.config/fastfetch/config.jsonc

# Fix permissions
USER root
RUN chown -R coder:coder /home/coder/.config/fish && \
    chown -R coder:coder /home/coder/.config/starship.toml && \
    chown -R coder:coder /home/coder/.config/fastfetch
USER coder

# Install zoxide
RUN curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
# Install Nvm
RUN fish -c "\
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher && \
    fisher install jorgebucaran/nvm.fish && \
    nvm install 22 && \
    curl -fsSL https://get.pnpm.io/install.sh | sh - \
  "

USER root
RUN cp -r /home/coder/. /home/files/ && find /home/coder -mindepth 1 -delete
USER coder

ENTRYPOINT [ "/usr/bin/fish" ]