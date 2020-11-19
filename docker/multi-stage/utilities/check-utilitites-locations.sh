#!/bin/zsh
utilities=(alsa-utils apt-file apt-utils arandr asciinema autorandr build-essential cmake compton curl dnsutils dnsmasq docker.io feh figlet fonts-font-awesome g++ gcc git gosu gtk-theme-switch gtk+3.0 htop httpie iftop iputils-ping irssi jq keychain libnotify-bin libnss3-tools libterm-readkey-perl lsb-core maim make man-db mpd nano ncdu ncmpcpp neovim net-tools netcat-openbsd numlockx openssl openvpn pavucontrol-qt pcmanfm perl pulseaudio python python-pip python3 python3-pip ranger ruby rofi software-properties-common ssh sudo sxhkd tigervnc-scraping-server tigervnc-standalone-server tmux transmission-cli transmission-common transmission-daemon tree vcsh vim wmctrl xauth xautolock xdotool xinit xinput xclip xorg xsel xserver-xorg zsh zathura)
bin=()
sbin=()
notfound=()
other=()

for util in $utilities; do
  location=$(which "$util")
  if [[ $location = "/usr/bin/"* ]]; then
    bin+=$util
  elif [[ $location = "/usr/sbin/"* ]]; then
    sbin+=$util
  elif [[ $location = *"not found" ]]; then
    notfound+=$util
  else
    other+="${util} in: ${location}"
  fi
done

echo "/usr/bin utilities:\n"
echo ${bin[@]}
echo "\n/usr/sbin utilities:\n"
echo ${sbin[@]}
echo "\nnot found utilities:\n"
echo ${notfound[@]}
echo "\noutliers:\n"
echo ${other[@]}

# packages have many locations of dependencies
# that can be listed with dpkg -L package
