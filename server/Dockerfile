###########################################################################
#
# Project: RAthena-Docker
# Base ajustada para Coolify + rAthena
#
###########################################################################

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Atualiza e instala dependências principais
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    make \
    git \
    pkg-config \
    zlib1g-dev \
    libpcre3-dev \
    libmariadb-dev \
    libmariadb-dev-compat \
    libssl-dev \
    dos2unix \
    vim \
    npm \
    mysql-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clona seu source
RUN git clone https://github.com/sistemaemundus/_SmokeWorld_rAthenaSmoke.git /root/rAthena

WORKDIR /root/rAthena

# Permissão do configure
RUN chmod +x configure

# Configure sem packetver (já definido no source)
RUN ./configure --enable-epoll=yes

# Compilação com log detalhado
#RUN make clean && make server V=1 > build.log 2>&1 || (cat build.log && exit 1)
RUN make clean
RUN make login-server V=1
RUN make char-server V=1
RUN make map-server V=1
RUN make web-server V=1

# Permissões dos binários
RUN chmod +x \
    login-server \
    char-server \
    map-server \
    web-server

# Boot script
COPY boot.sh ./boot.sh
RUN chmod +x ./boot.sh
RUN dos2unix ./boot.sh

ENTRYPOINT ["./boot.sh"]