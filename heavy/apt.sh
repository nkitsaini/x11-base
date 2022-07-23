#!/bin/bash
echo "apt.sh start"
set -e
apt update

# 1. basic
# 2. guacamole
# 3. other
apt update
apt install -y sudo 

sudo apt install -y -q git                                tmux p7zip vlc python3-pip python3-venv curl xournal \
	 unrar i3 xdotool nautilus terminator baobab git-cola xbindkeys sqlitebrowser \
	redshift sshuttle mosh gimp zfsutils-linux remmina aircrack-ng xclip neovim fswebcam shotwell \
	net-tools wireguard iproute2 iputils-ping fzf i3blocks sudo pulseaudio resolvconf docker.io \
	docker-compose socat ffmpeg jq tree mosh cmake pkg-config libfreetype6-dev \
	libfontconfig1-dev libxcb-xfixes0-dev \
	libxkbcommon-dev python3 libiw-dev tldr python3-tk recordmydesktop libnotify-bin \
	notify-osd \
	httpie postgresql-client rsync simplescreenrecorder dvtm \
	direnv feh zathura \
	unzip libgit2-dev python3-pygit2 \
	libbz2-dev libbz2-1.0 sqlite3 libsqlite3-dev libreadline-dev \
	software-properties-common xserver-xephyr zip qbittorrent lld bsdmainutils fonts-firacode fonts-noto-extra \
	restic maim dbus-x11 command-not-found crun python-is-python3 ncdu iperf apt-file traceroute aria2 nethogs  \
	gcc make libc6-dev libjpeg8-dev libx11-dev x11proto-core-dev libxext-dev libxtst-dev libxdamage-dev libxfixes-dev libxrandr-dev \
	libxinerama-dev libxss-dev zlib1g-dev libssl-dev libavahi-client-dev linux-libc-dev x11vnc xvfb libssl3 trash-cli \
	build-essential                                    libcairo2-dev libjpeg-turbo8-dev libpng-dev libtool-bin libossp-uuid-dev libvncserver-dev freerdp2-dev libssh2-1-dev \
	libtelnet-dev libwebsockets-dev libpulse-dev libvorbis-dev libwebp-dev libssl-dev libpango1.0-dev libswscale-dev libavcodec-dev \
	libavutil-dev libavformat-dev wget tomcat9 tomcat9-admin tomcat9-common tomcat9-user \
	libssl-dev openssl                                 libacl1-dev libacl1 liblz4-dev liblz4-1 build-essential \
	libpq-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev \
	cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev podman borgbackup \
	pyhoca-cli 
