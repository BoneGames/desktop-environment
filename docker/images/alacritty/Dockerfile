ARG DESKTOP_ENVIRONMENT_BASE
FROM $DESKTOP_ENVIRONMENT_BASE:latest

# Install alacritty
RUN sudo apt-get update -qq && \
  sudo apt-get install -qq \
  pkg-config \
  libfreetype6-dev \
  libfontconfig1-dev \
  libxcb-xfixes0-dev && \
  curl -sSf -4 "https://sh.rustup.rs" | sh -s -- -y && \
  export PATH=$PATH:$HOME/.cargo/bin && \
  rustup override set stable && \
  rustup update stable && \
  cargo install --git https://github.com/alacritty/alacritty --tag v0.5.0

ENTRYPOINT ~/.config/scripts/startup.sh && sleep infinity
