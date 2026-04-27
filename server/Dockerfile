# server/Dockerfile

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependências apenas para execução
RUN apt-get update && apt-get install -y \
    git \
    default-mysql-client \
    libpcre3 \
    libssl3 \
    zlib1g \
    libmariadb3 \
    dos2unix \
    vim \
    netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clona sua source já compilada
RUN git clone https://github.com/sistemaemundus/_SmokeWorld_rAthenaSmoke.git /root/rAthena

# Como o build context é ./server, o correto é COPY boot.sh
COPY boot.sh /root/rAthena/boot.sh

WORKDIR /root/rAthena

# Permissões
RUN chmod +x \
    login-server \
    char-server \
    map-server \
    web-server \
    boot.sh

# Corrige final de linha
RUN dos2unix /root/rAthena/boot.sh

# Inicialização
ENTRYPOINT ["/bin/bash", "/root/rAthena/boot.sh"]