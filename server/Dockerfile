# server/Dockerfile

# --------------------- ESTÁGIO DE COMPILAÇÃO ---------------------
FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

# Instala dependências de compilação
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libmysqlclient-dev \
    libpcre3-dev \
    zlib1g-dev \
    libssl-dev \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clona o repositório com o código fonte
RUN git clone https://github.com/sistemaemundus/_SmokeWorld_rAthenaSmoke.git /root/rAthena

WORKDIR /root/rAthena

# Compila os servidores (agora com permissão para o configure)
#RUN chmod +x configure && ./configure && make clean && make server
RUN chmod +x configure && ./configure && make clean && make -j1 server

# --------------------- ESTÁGIO FINAL ---------------------
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instala apenas as dependências de execução
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    libpcre3 \
    libssl3 \
    zlib1g \
    libmysqlclient21 \
    dos2unix \
    vim \
    netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copia os binários compilados do estágio builder
COPY --from=builder /root/rAthena/login-server /root/rAthena/char-server /root/rAthena/map-server /root/rAthena/web-server /root/rAthena/

COPY boot.sh /root/rAthena/boot.sh

WORKDIR /root/rAthena

RUN chmod +x login-server char-server map-server web-server boot.sh && \
    dos2unix boot.sh

EXPOSE 5121 6121 6900 8000

ENTRYPOINT ["/bin/bash", "/root/rAthena/boot.sh"]