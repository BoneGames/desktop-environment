FROM bonegames/utilities

ARG DESKTOP_ENVIRONMENT_HOST_USER_PASSWORD
ARG DESKTOP_ENVIRONMENT_USER
ARG DESKTOP_ENVIRONMENT_GITHUB_USER

ENV DESKTOP_ENVIRONMENT_HOST_USER_PASSWORD ${DESKTOP_ENVIRONMENT_HOST_USER_PASSWORD:-'$6$7De0aW9hUvGDKZmc$qrylcFmwKAL9iGNG9dvQ/GXCM4gLY.hES/P2d/3ZzRxkVMjD77WeTVSxV1P9XtmE9iAUmDwDTCHiVK.p5Ct1y1:18193:0:99999:7:::'}
ENV EDITOR nano
ENV LANG en_US.UTF-8
ENV LANGUAGE $LANG
ENV LC_ALL $LANG
ENV LC_CTYPE $LANG
ENV SHELL /bin/zsh
ENV TERM xterm-256color
ENV USER $DESKTOP_ENVIRONMENT_USER
ENV TZ Australia/Sydney

ENV HOME /home/$USER

# Ensure container image sources are always available by using 'old' repositories
#RUN sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

# Install locales and timezone data
RUN apt-get update -qq && \
  apt-get install -qq \
  locales \
  tzdata

# Generate locales
RUN locale-gen $LANG && \
  update-locale LC_ALL=$LC_ALL LANG=$LANG && \
  dpkg-reconfigure --frontend=noninteractive locales

# Set timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  echo $TZ > /etc/timezone


# Install alacritty
RUN wget -O alacritty.deb -nv https://github.com/jwilm/alacritty/releases/download/v0.3.3/Alacritty-v0.3.3-ubuntu_18_04_amd64.deb && \
  dpkg -i alacritty.deb && \
  rm alacritty.deb

# Install arc
RUN wget -O /usr/local/bin/arc -q https://github.com/mholt/archiver/releases/download/v3.1.1/arc_linux_amd64 && \
  chmod +x /usr/local/bin/arc

# Install bandwhich
RUN curl -fsSL https://github.com/imsnif/bandwhich/releases/download/0.10.0/bandwhich-v0.10.0-x86_64-unknown-linux-musl.tar.gz | \
  tar -C /usr/local/bin -xzf -

# Install bat
RUN wget -O bat.deb -q https://github.com/sharkdp/bat/releases/download/v0.9.0/bat_0.9.0_amd64.deb && \
  dpkg -i bat.deb && \
  rm bat.deb

# Install chrome
RUN apt-get update -qq && \
  apt-get install -qq \
  apt-transport-https \
  ca-certificates \
  gnupg \
  hicolor-icon-theme \
  libcanberra-gtk* \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libpango1.0-0 \
  libpulse0 \
  libv4l-0 \
  fonts-symbola \
  --no-install-recommends && \
  curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update -qq && \
  apt-get install -qq google-chrome-stable --no-install-recommends && \
  rm /etc/apt/sources.list.d/google.list && \
  wget -O /etc/fonts/local.conf -nv https://raw.githubusercontent.com/jessfraz/dockerfiles/master/chrome/stable/local.conf && \
  groupadd --system chrome

# Install cmatrix
RUN apt-get install -qq libncurses5-dev && \
  git clone --depth 1 https://github.com/abishekvashok/cmatrix && \
  mkdir -p cmatrix/build && \
  cd cmatrix/build && \
  cmake .. && \
  make && \
  make install

# Install cool retro term
RUN add-apt-repository ppa:vantuz/cool-retro-term && \
  apt-get update -qq && \
  apt-get install -qq cool-retro-term

# Install ctop
RUN wget https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64 -O /usr/local/bin/ctop && \
  chmod +x /usr/local/bin/ctop

# Install define
RUN wget -O /usr/local/bin/define -q https://github.com/Rican7/define/releases/download/v0.1.2/define_linux_amd64 && \
  chmod +x /usr/local/bin/define

# Install desktop environment
RUN git clone --depth 1 https://github.com/sabrehagen/desktop-environment.git /opt/desktop-environment

# Install docker-compose
RUN curl -fsSL "https://github.com/docker/compose/releases/download/1.25.0-rc1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

# Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && \
  $HOME/.fzf/install --bin

# Install gist
RUN gem install gist

# Install go
RUN add-apt-repository ppa:longsleep/golang-backports && \
  apt-get update -qq && \
  apt-get install -qq golang-go

# Install gotop
RUN wget -q -O gotop-deb https://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_amd64.deb && \
  dpkg -i gotop-deb

# Install gotty
RUN curl -fsSL https://github.com/yudai/gotty/releases/download/v2.0.0-alpha.3/gotty_2.0.0-alpha.3_linux_amd64.tar.gz | \
  tar -C /usr/local/bin -xzf -

# Install i3
RUN add-apt-repository ppa:kgilmer/speed-ricer && \
  apt-get update -qq && \
  apt-get install -qq i3blocks i3-gaps i3lock-fancy && \
  sed -i 's/TEXT=".*"/TEXT=""/' /usr/bin/i3lock-fancy && \
  sed -i 's/rm -f "$IMAGE"//' /usr/bin/i3lock-fancy && \
  wget -q -O /usr/share/i3lock-fancy/lock.png http://png-pixel.com/1x1-00000000.png && \
  pip3 install --user i3-resurrect==1.4.2 && \
  pip3 install --force --user i3-workspace-names-daemon && \
  git clone https://github.com/s-urbaniak/i3-focus-last ~/.config/i3/i3-focus-last && \
  cd ~/.config/i3/i3-focus-last && \
  go install

# Install jobber
RUN wget -O jobber.deb -q https://github.com/dshearer/jobber/releases/download/v1.4.0/jobber_1.4.0-1_amd64.deb && \
  dpkg -i jobber.deb || apt-get install -qq --fix-broken && \
  rm jobber.deb

# Install jump directory navigator
RUN wget -q -O jump.deb https://github.com/gsamokovarov/jump/releases/download/v0.22.0/jump_0.22.0_amd64.deb && \
  dpkg -i jump.deb && \
  rm jump.deb

# Install lazydocker
RUN curl -fsSL https://github.com/jesseduffield/lazydocker/releases/download/v0.2.4/lazydocker_0.2.4_Linux_x86_64.tar.gz | \
  tar -C /usr/local/bin -xzf -

# Install lazygit
RUN curl -fsSL https://github.com/jesseduffield/lazygit/releases/download/v0.8.1/lazygit_0.8.1_Linux_x86_64.tar.gz | \
  tar -C /usr/local/bin -xzf -

# Install musikcube
RUN wget -O musikcube.deb -nv https://github.com/clangen/musikcube/releases/download/0.90.0/musikcube_0.90.0_ubuntu_disco_amd64.deb && \
  dpkg -i musikcube.deb || apt-get install -qq --fix-broken && \
  rm musikcube.deb

# Install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -

# Install novnc
RUN git clone --depth 1 https://github.com/cloud-computer/noVNC.git /opt/noVNC && \
  git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
  sudo ln -s /opt/noVNC/utils/launch.sh /usr/local/bin/novnc

# Install pulseaudio mixer
RUN wget -O /usr/local/bin/pulsemixer -nv https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer && \
  chmod +x /usr/local/bin/pulsemixer

# Install pywal
RUN pip3 install --user pywal

# Install resucetime time tracker
RUN wget -O rescuetime.deb -nv https://www.rescuetime.com/installers/rescuetime_current_amd64.deb && \
  dpkg -i rescuetime.deb || apt-get install -qq --fix-broken && \
  rm rescuetime.deb

# Install speedtest
RUN pip install --user speedtest-cli

# Install timeago
RUN wget -O /usr/local/bin/timeago -nv https://raw.githubusercontent.com/sabrehagen/timeago/master/timeago && \
  chmod +x /usr/local/bin/timeago

# Install tormix
RUN wget -O /usr/local/bin/tormix -nv https://raw.githubusercontent.com/ckardaris/tormix/master/tormix && \
  chmod +x /usr/local/bin/tormix

# Install tmuxinator
RUN gem install tmuxinator -v 1.1.5

# Install vs code, vs live share dependencies, shfmt extension dependency, and vs-wal
RUN wget -O code.deb -nv https://go.microsoft.com/fwlink/?LinkID=760868 && \
  apt-get install -qq ./code.deb && \
  rm code.deb && \
  apt-get install -qq libicu[0-9][0-9] libkrb5-3 zlib1g libsecret-1-0 desktop-file-utils x11-utils && \
  wget -O /usr/local/bin/shfmt -nv https://github.com/mvdan/sh/releases/download/v2.6.3/shfmt_v2.6.3_linux_amd64 && \
  chmod +x /usr/local/bin/shfmt

# Install warnai
RUN apt-get update -qq && \
  apt-get install -qq inkscape optipng xfconf && \
  git clone --depth 1 https://github.com/reorr/warnai /opt/warnai && \
  sed -i '/notify-send/d' /opt/warnai/warnai

# Install xava
RUN apt-get update -qq && \
  apt-get install -qq \
  libfftw3-dev \
  libasound2-dev \
  libpulse-dev \
  libx11-dev \
  libsdl2-dev && \
  git clone --depth 1 https://github.com/sabrehagen/xava && \
  git clone --depth 1 https://github.com/ndevilla/iniparser xava/lib/iniparser && \
  mkdir xava/build && \
  cd xava/build && \
  cmake .. -DCMAKE_BUILD_TYPE=Debug -DINCLUDE_DIRS=lib/iniparser/src && \
  make -j$(nproc) && \
  make install

# Install yarn
RUN curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && \
  apt-get install -qq yarn

# Install yarn based utilities
RUN yarn global add \
  clipboard-cli \
  github-email \
  http-server \
  imgur-uploader-cli \
  localtunnel \
  ngrok \
  rebase-editor \
  tldr && \
  tldr --update

# Configure openvpn
RUN mkdir -p $HOME/.config/openvpn && \
  mknod $HOME/.config/openvpn/tun c 10 200 && \
  chmod 600 $HOME/.config/openvpn/tun && \
  wget -O $HOME/.config/openvpn/america.ovpn -nv https://downloads.nordcdn.com/configs/files/ovpn_legacy/servers/us4672.nordvpn.com.tcp443.ovpn && \
  wget -O $HOME/.config/openvpn/sydney.ovpn -nv https://downloads.nordcdn.com/configs/files/ovpn_legacy/servers/au698.nordvpn.com.tcp443.ovpn && \
  wget -O $HOME/.config/openvpn/india.ovpn -nv https://downloads.nordcdn.com/configs/files/ovpn_legacy/servers/in82.nordvpn.com.tcp443.ovpn

# Configure password-less sudo for the sudo group
RUN echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

# Configure X11 permissions
RUN sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config && \
  echo needs_root_rights=yes >> /etc/X11/Xwrapper.config && \
  chmod u+s /usr/bin/xinit

# Create a non-root user for safe operation
RUN useradd \
  --create-home \
  --groups audio,chrome,docker,input,netdev,shadow,sudo,tty,video \
  --shell /bin/zsh \
  $USER

# Set non-root user password
RUN sed -i "s;^$USER:[^:]*;$USER:$DESKTOP_ENVIRONMENT_HOST_USER_PASSWORD;" /etc/shadow

# Take ownership of user's home directory and applications
RUN chown -R $USER:$USER $HOME /opt

# Become desktop environment user
USER $USER
WORKDIR $HOME

# If the DOTFILES_CACHEBUST build arg is supplied, rebuild from static dotfiles onwards
ARG DOTFILES_CACHEBUST
RUN DOTFILES_CACHEBUST=$DOTFILES_CACHEBUST echo "Building from dotfiles..."

# Clone user dotfiles or fallback to sabrehagen dotfiles
RUN vcsh clone git://github.com/$DESKTOP_ENVIRONMENT_GITHUB_USER/dotfiles.git

# Bootstrap dotfiles
RUN $HOME/.dotfiles-bootstrap.sh

# Record container build information
ARG DESKTOP_CONTAINER_GIT_SHA
ENV CONTAINER_GIT_SHA $DESKTOP_CONTAINER_GIT_SHA
ARG DESKTOP_ENVIRONMENT_CONTAINER_IMAGE_NAME
ENV DESKTOP_ENVIRONMENT_CONTAINER_IMAGE_NAME $DESKTOP_ENVIRONMENT_CONTAINER_IMAGE_NAME
