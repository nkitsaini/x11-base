# syntax = docker/dockerfile:1.3
FROM docker.io/library/ubuntu:21.10

RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
CMD ["bash"]
