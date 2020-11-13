FROM ubuntu:19.04

# Ensure container image sources are always available by using 'old' repositories
RUN sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

# Install desktop environment utilities
RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qq --fix-missing \
  alsa-utils \
  apt-file \
  apt-utils \
  arandr \
  asciinema \
  autorandr \
  build-essential \
  cmake \
  compton \
  curl \
  dnsutils \
  dnsmasq \
  docker.io \
  feh \
  figlet \
  fonts-font-awesome \
  g++ \
  gcc \
  git \
  gosu \
  gtk-theme-switch \
  gtk+3.0 \
  htop \
  httpie \
  iftop \
  iputils-ping \
  irssi \
  jq \
  keychain \
  libnotify-bin \
  libnss3-tools \
  libterm-readkey-perl \
  lsb-core \
  maim \
  make \
  man-db \
  mpd \
  nano \
  ncdu \
  ncmpcpp \
  neovim \
  net-tools \
  netcat-openbsd \
  numlockx \
  openssl \
  openvpn \
  pavucontrol-qt \
  pcmanfm \
  perl \
  pulseaudio \
  python \
  python-pip \
  python3 \
  python3-pip \
  ranger \
  ruby \
  rofi \
  software-properties-common \
  ssh \
  sudo \
  sxhkd \
  tigervnc-scraping-server \
  tigervnc-standalone-server \
  tmux \
  transmission-cli \
  transmission-common \
  transmission-daemon \
  tree \
  vcsh \
  vim \
  wmctrl \
  xauth \
  xautolock \
  xdotool \
  xinit \
  xinput \
  xclip \
  xorg \
  xsel \
  xserver-xorg \
  zsh \
  zathura && \
  apt-file update


# Record container build information
ENV DESKTOP_ENVIRONMENT_CONTAINER_IMAGE_NAME "utilities"
