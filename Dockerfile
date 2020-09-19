FROM ubuntu:20.04

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y curl build-essential telnet \ 
       texinfo zip netcat gawk libz-dev telnet vim \
       git sudo astyle tmux gputils \
    && apt-get autoclean

RUN adduser siuyin --disabled-password \
    && echo 'siuyin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 
COPY --chown=siuyin:siuyin .vimrc /home/siuyin/.vimrc

RUN cd /tmp \
    && curl -OL https://downloads.sourceforge.net/project/sdcc/sdcc-linux-amd64/4.0.0/sdcc-4.0.0-amd64-unknown-linux2.5.tar.bz2 \
    && tar xf /tmp/sdcc-4.0.0-amd64-unknown-linux2.5.tar.bz2 --strip-components=1 -C /usr/local \
    && rm -f /tmp/sdcc-4.0.0-amd64-unknown-linux2.5.tar.bz2

USER siuyin
WORKDIR /home/siuyin
