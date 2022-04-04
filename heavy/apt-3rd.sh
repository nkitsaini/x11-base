#!/bin/bash
set -e

#echo "" | sudo tee /etc/apt/sources.list.d/jp.list
sudo apt -y update
####### fish
sudo sudo apt-add-repository ppa:fish-shell/release-3


sudo apt-get update
sudo apt-get install -y fish

####### rust
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

########## vscode
#curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee -a /etc/apt/sources.list.d/jp.list

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code # or code-insiders

#wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O /tmp/code.deb --progress=dot:mega
#sudo apt-get install -y /tmp/code.deb

########## signal desktop
# curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
# echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/jp.list

########## DBEAVER
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O /tmp/dbeaver.deb --progress=dot:mega
sudo apt-get -y install /tmp/dbeaver.deb


# ########## keybase
# curl -s https://keybase.io/docs/server_security/code_signing_key.asc | sudo apt-key add -
# echo "deb http://prerelease.keybase.io/deb stable main" | sudo tee -a /etc/apt/sources.list.d/jp.list

######### chrome
# curl -s https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/jp.list

########## chromium
#sudo add-apt-repository -y ppa:chromium-team/beta

######### docker
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
## TODO change ubuntu release
# echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan stable" | sudo tee -a /etc/apt/sources.list.d/jp.list

#sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

########### wireguard
#sudo add-apt-repository -y ppa:wireguard/wireguard

# sudo apt -y install signal-desktop
#sudo apt -y install google-chrome-stable
# sudo apt -y install docker-ce docker-ce-cli containerd.io
# sudo apt -y install docker-compose

# borg backup
# sudo apt-get -y install libfuse-dev fuse pkg-config    # optional, for FUSE support
#sudo pip3 install wheel borgbackup[fuse] youtube-dl

# follow https://wiki.archlinux.org/index.php/avahi#Hostname_resolution change for avahi detection of mac mini
#http://askubuntu.com/questions/165679/how-to-manage-available-wireless-network-priority


# chromium
sudo tee - a /etc/apt/sources.list.d/debian.list > /dev/null <<EOL
deb http://deb.debian.org/debian buster main
deb http://deb.debian.org/debian buster-updates main
deb http://deb.debian.org/debian-security buster/updates main
EOL

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A



sudo tee - a /etc/apt/preferences.d/chromium.pref > /dev/null <<EOL
# Note: 2 blank lines are required between entries
Package: *
Pin: release a=eoan
Pin-Priority: 500


Package: *
Pin: origin "ftp.debian.org"
Pin-Priority: 300


# Pattern includes 'chromium', 'chromium-browser' and similarly
# named dependencies:
Package: chromium*
Pin: origin "ftp.debian.org"
Pin-Priority: 700
EOL

apt update
apt install -y chromium

curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && sudo apt-get install -y nodejs


cd /tmp
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64

sudo cp rclone /usr/bin/
sudo chown root:root /usr/bin/rclone
sudo chmod 755 /usr/bin/rclone

sudo mkdir -p /usr/local/share/man/man1
sudo cp rclone.1 /usr/local/share/man/man1/
sudo mandb
