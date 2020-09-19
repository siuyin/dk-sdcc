FROM ubuntu:20.04

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y curl build-essential telnet \ 
       texinfo zip netcat gawk libz-dev telnet vim \
       git sudo astyle tmux \
    && apt-get autoclean

RUN adduser siuyin --disabled-password \
    && echo 'siuyin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 
COPY --chown=siuyin:siuyin .vimrc /home/siuyin/.vimrc

ADD https://sourceforge.net/projects/sdcc/files/sdcc-linux-amd64/4.0.0/sdcc-4.0.0-amd64-unknown-linux2.5.tar.bz2 /tmp
RUN cp -r /tmp/sdcc-4.0.0/bin /usr/local \
    && cp -r /tmp/sdcc-4.0.0/share /usr/local \
    && rm -rf /tmp/sdcc-4.0.0

USER siuyin
WORKDIR /home/siuyin
