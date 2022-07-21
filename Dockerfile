# syntax = docker/dockerfile:1.3
FROM docker.io/library/ubuntu:21.10

RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache

RUN sh -c "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections" && \
	echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections && \
	apt-get update && yes |unminimize

RUN mkdir -p /tmp/heavy/
WORKDIR /tmp/

COPY ./heavy/apt.sh /tmp/heavy/
RUN   bash /tmp/heavy/apt.sh

COPY ./heavy/apt-3rd.sh /tmp/heavy/
RUN mkdir -p /tmp/apt3-cache
RUN sudo bash /tmp/heavy/apt-3rd.sh

COPY ./heavy/requirements.txt /tmp/heavy
RUN sudo pip3 install -r /tmp/heavy/requirements.txt


RUN useradd -ms /bin/bash future_user && echo "future_user:future_user" | chpasswd && adduser future_user sudo \
	&& sed -i 's/future_user/1000/g' /etc/subuid /etc/subgid

COPY ./configs/containers.conf /etc/containers/containers.conf
RUN mkdir -p /run/user/1000 \
	&& chown -R 1000:1000 /run/user/1000


USER future_user
RUN wget --https-only --secure-protocol=TLSv1_2 -O- https://sh.rustup.rs | sh /dev/stdin -y

COPY ./heavy/cargo_installs.sh /tmp/heavy
RUN bash /tmp/heavy/cargo_installs.sh
USER future_user
