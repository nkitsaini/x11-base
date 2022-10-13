# syntax = docker/dockerfile:1.3
FROM docker.io/library/archlinux:base-20221009.0.92802


# Pacman Init + mirror setup + yay installation
RUN pacman -Syu --noconfirm && pacman-key --init \
	&& pacman -S --noconfirm reflector && reflector --ipv4 -p "http,https" -f 5 -c 'india,' --sort rate > /etc/pacman.d/mirrorlist \
	&& pacman -S --noconfirm git sudo base-devel go \
	&& useradd -ms /bin/bash -G wheel -p paV6FM/UE91/I future_user \
	&& echo "%wheel   ALL=(ALL)   ALL" >>  /etc/sudoers \
	&& echo "future_user   ALL=(ALL)   NOPASSWD: ALL" >>  /etc/sudoers \
	&& cd /opt && git clone https://aur.archlinux.org/yay-git.git && chown -R future_user:future_user ./yay-git  \
	&& echo "ran on 22-08-11"

USER future_user
RUN cd /opt/yay-git && makepkg -s
USER root
RUN cd /opt/yay-git && pacman --noconfirm -U $(ls | grep 'yay-git')


# Internal Container setup
COPY ./configs/containers.conf /etc/containers/containers.conf
RUN mkdir -p /run/user/1000 && chown -R 1000:1000 /run/user/1000


RUN mkdir -p /tmp/heavy/
WORKDIR /tmp/

USER future_user
COPY ./heavy/pacman.sh /tmp/heavy/
RUN   bash /tmp/heavy/pacman.sh

USER root
COPY ./heavy/requirements.txt /tmp/heavy
RUN sudo pip3 install -r /tmp/heavy/requirements.txt
# Remove nopasswd for future_user
RUN sed -i '$ d' /etc/sudoers
USER future_user
