FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    default-mysql-client \
    libpcre3 \
    libssl3 \
    zlib1g \
    libmariadb3 \
    dos2unix \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clona sua source compilada
RUN git clone https://github.com/sistemaemundus/_SmokeWorld_rAthenaSmoke.git /root/rAthena

# Como o contexto é a raiz (/), precisa apontar server/boot.sh
COPY server/boot.sh /root/rAthena/boot.sh

WORKDIR /root/rAthena

RUN chmod +x \
    login-server \
    char-server \
    map-server \
    web-server \
    boot.sh

RUN dos2unix /root/rAthena/boot.sh

ENTRYPOINT ["/bin/bash", "/root/rAthena/boot.sh"]