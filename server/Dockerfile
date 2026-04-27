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

# Compila os servidores
RUN ./configure && make clean && make server

# --------------------- ESTÁGIO FINAL ---------------------
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instala apenas as dependências de execução (mais leves)
RUN apt-get update && apt-get install -y \
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

# Copia os binários compilados do estágio builder
COPY --from=builder /root/rAthena/login-server /root/rAthena/char-server /root/rAthena/map-server /root/rAthena/web-server /root/rAthena/

# Copia o script de inicialização (você pode mantê-lo local ou clonar novamente)
COPY boot.sh /root/rAthena/boot.sh

WORKDIR /root/rAthena

# Permissões de execução
RUN chmod +x login-server char-server map-server web-server boot.sh

# Corrige final de linha (caso necessário)
RUN dos2unix boot.sh

# Expor portas padrão do rAthena (opcional)
EXPOSE 5121 6121 6900 8000

ENTRYPOINT ["/bin/bash", "/root/rAthena/boot.sh"]