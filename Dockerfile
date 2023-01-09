FROM ubuntu:latest

ARG DEBIAN_FRONTEND="noninteractive"
ARG NODE_VER

RUN apt update \
&& apt install -y zip wget git curl telnet
ENV NODE_HOME /usr/local/bin/node-${NODE_VER}
RUN wget https://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}-linux-x64.tar.gz -O /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN tar -C /usr/local/bin -xf /tmp/node-${NODE_VER}-linux-x64.tar.gz
RUN mv /usr/local/bin/node-v${NODE_VER}-linux-x64 ${NODE_HOME}
ENV PATH ${NODE_HOME}/bin:$PATH

WORKDIR /app