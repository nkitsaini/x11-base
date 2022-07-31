#!/bin/bash

# Should run this file as the user itself
# Cache sudo password to avoid interactivity
#TODO: find a better place to put this
### LOCALE
echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
sudo locale-gen
###

set -e
reflector --ipv4 -p "http,https" -n 5 -f 5 -c 'india,' --sort rate | sudo tee /etc/pacman.d/mirrorlist
yay -Syyu --noconfirm

# Reset pacman config to include manpages and other helpers
yay -S --noconfirm pacman
cd /
sudo tar xf /var/cache/pacman/pkg/pacman-*x86_64.pkg.tar.zst etc/pacman.conf

# Install all packages
yay -S --noconfirm man nodejs npm man-pages xclip xbindkeys noto-fonts-emoji archlinux-keyring sudo git tmux vlc p7zip python wget git i3 xdotool nautilus terminator wireguard fzf i3blocks resolvconf jq tree \
	mosh tldr httpie rsync feh zathura python-iwlib starship sd ripgrep dust pipewire pipewire-pulse \
	unzip sqlite3 zip qbittorrent ttf-fira-code noto-fonts-extra restic crun ncdu aria2 nethogs borgbackup podman python-pip simplescreenrecorder iputils neovim pkgfile \
	fish rust visual-studio-code-bin chromium signal-desktop obsidian rclone firefox dmenu alacritty

######## rust
##curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#
########### vscode
##curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
##echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee -a /etc/apt/sources.list.d/jp.list
#
#wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
#sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
#rm -f packages.microsoft.gpg
#sudo apt update
#sudo apt install code # or code-insiders
#
##wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O /tmp/code.deb --progress=dot:mega
##sudo apt-get install -y /tmp/code.deb
#
########### signal desktop
## curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
## echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/jp.list
#
########### DBEAVER
#wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O /tmp/dbeaver.deb --progress=dot:mega
#sudo apt-get -y install /tmp/dbeaver.deb
#
#
## ########## keybase
## curl -s https://keybase.io/docs/server_security/code_signing_key.asc | sudo apt-key add -
## echo "deb http://prerelease.keybase.io/deb stable main" | sudo tee -a /etc/apt/sources.list.d/jp.list
#
########## chrome
## curl -s https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
## echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/jp.list
#
########### chromium
##sudo add-apt-repository -y ppa:chromium-team/beta
#
########## docker
## curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
### TODO change ubuntu release
## echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan stable" | sudo tee -a /etc/apt/sources.list.d/jp.list
#
##sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#
############ wireguard
##sudo add-apt-repository -y ppa:wireguard/wireguard
#
## sudo apt -y install signal-desktop
##sudo apt -y install google-chrome-stable
## sudo apt -y install docker-ce docker-ce-cli containerd.io
## sudo apt -y install docker-compose
#
## borg backup
## sudo apt-get -y install libfuse-dev fuse pkg-config    # optional, for FUSE support
##sudo pip3 install wheel borgbackup[fuse] youtube-dl
#
## follow https://wiki.archlinux.org/index.php/avahi#Hostname_resolution change for avahi detection of mac mini
##http://askubuntu.com/questions/165679/how-to-manage-available-wireless-network-priority
#
#
## chromium
#sudo tee - a /etc/apt/sources.list.d/debian.list > /dev/null <<EOL
#deb http://deb.debian.org/debian buster main
#deb http://deb.debian.org/debian buster-updates main
#deb http://deb.debian.org/debian-security buster/updates main
#EOL
#
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A
#
#
#
#sudo tee - a /etc/apt/preferences.d/chromium.pref > /dev/null <<EOL
## Note: 2 blank lines are required between entries
#Package: *
#Pin: release a=eoan
#Pin-Priority: 500
#
#
#Package: *
#Pin: origin "ftp.debian.org"
#Pin-Priority: 300
#
#
## Pattern includes 'chromium', 'chromium-browser' and similarly
## named dependencies:
#Package: chromium*
#Pin: origin "ftp.debian.org"
#Pin-Priority: 700
#EOL
#
#apt update
#apt install -y chromium
#
## Node/NPM
#curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && sudo apt-get install -y nodejs
#
#
## Rclone
#cd /tmp
#curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
#unzip rclone-current-linux-amd64.zip
#cd rclone-*-linux-amd64
#
#sudo cp rclone /usr/bin/
#sudo chown root:root /usr/bin/rclone
#sudo chmod 755 /usr/bin/rclone
#
#sudo mkdir -p /usr/local/share/man/man1
#sudo cp rclone.1 /usr/local/share/man/man1/
#sudo mandb
#
## Signal
#wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
#cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
#echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
#sudo apt update && sudo apt install -y signal-desktop
#
#
## Obsidian
#TAG=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/obsidianmd/obsidian-releases/releases/latest | sed 's/.*\///g' | sed 's/v//g') # 0.15.6
#wget https://github.com/obsidianmd/obsidian-releases/releases/download/v${TAG}/obsidian_${TAG}_amd64.deb -O /tmp/obsidian.deb --progress=dot:mega
#sudo apt-get -y install /tmp/obsidian.deb
#
#
## Firefox
#sudo apt remove -y firefox
#sudo add-apt-repository -y ppa:mozillateam/ppa
#sudo apt install -y -t 'o=LP-PPA-mozillateam' firefox
#
#sudo tee - a /etc/apt/preferences.d/mozillateamppa.pref > /dev/null <<EOL
#
#Package: firefox*
#Pin: release o=LP-PPA-mozillateam
#Pin-Priority: 501
#
#EOL
#
#sudo apt install -y -q git                                tmux p7zip vlc python3-pip python3-venv curl xournal \
#	 unrar i3 xdotool nautilus terminator baobab git-cola xbindkeys sqlitebrowser \
#	redshift sshuttle mosh gimp zfsutils-linux remmina aircrack-ng xclip neovim fswebcam shotwell \
#	net-tools wireguard iproute2 iputils-ping fzf i3blocks sudo pulseaudio resolvconf docker.io \
#	docker-compose socat ffmpeg jq tree mosh cmake pkg-config libfreetype6-dev \
#	libfontconfig1-dev libxcb-xfixes0-dev \
#	libxkbcommon-dev python3 libiw-dev tldr python3-tk recordmydesktop libnotify-bin \
#	notify-osd \
#	httpie postgresql-client rsync simplescreenrecorder dvtm \
#	direnv feh zathura \
#	unzip libgit2-dev python3-pygit2 \
#	libbz2-dev libbz2-1.0 sqlite3 libsqlite3-dev libreadline-dev \
#	software-properties-common xserver-xephyr zip qbittorrent lld bsdmainutils fonts-firacode fonts-noto-extra \
#	restic maim dbus-x11 command-not-found crun python-is-python3 ncdu iperf apt-file traceroute aria2 nethogs  \
#	gcc make libc6-dev libjpeg8-dev libx11-dev x11proto-core-dev libxext-dev libxtst-dev libxdamage-dev libxfixes-dev libxrandr-dev \
#	libxinerama-dev libxss-dev zlib1g-dev libssl-dev libavahi-client-dev linux-libc-dev x11vnc xvfb libssl3 trash-cli \
#	build-essential                                    libcairo2-dev libjpeg-turbo8-dev libpng-dev libtool-bin libossp-uuid-dev libvncserver-dev freerdp2-dev libssh2-1-dev \
#	libtelnet-dev libwebsockets-dev libpulse-dev libvorbis-dev libwebp-dev libssl-dev libpango1.0-dev libswscale-dev libavcodec-dev \
#	libavutil-dev libavformat-dev wget tomcat9 tomcat9-admin tomcat9-common tomcat9-user \
#	libssl-dev openssl                                 libacl1-dev libacl1 liblz4-dev liblz4-1 build-essential \
#	libpq-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev \
#	cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev podman borgbackup \
#	pyhoca-cli 
##!/bin/bash
#set -e
#
##echo "" | sudo tee /etc/apt/sources.list.d/jp.list
#sudo apt -y update
######## fish
#sudo sudo apt-add-repository -y ppa:fish-shell/release-3
#
#
#sudo apt-get update
#sudo apt-get install -y fish
#
