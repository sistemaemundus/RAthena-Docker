###########################################################################
#
# Dockerfile para executar rAthena já compilado
# (sem compilar dentro do Coolify)
#
###########################################################################

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Apenas dependências de execução
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

# Clona sua source já compilada
RUN git clone https://github.com/sistemaemundus/_SmokeWorld_rAthenaSmoke.git /root/rAthena
#COPY ./boot.sh /root/rAthena/boot.sh

WORKDIR /root/rAthena

# Garante permissão dos binários já compilados
RUN chmod +x \
    login-server \
    char-server \
    map-server \
    web-server \
    boot.sh

# Boot script
#COPY ./boot.sh /root/rAthena/boot.sh
#RUN chmod +x ./boot.sh
RUN dos2unix ./boot.sh

# Inicialização
#ENTRYPOINT ["./boot.sh"]
ENTRYPOINT ["/bin/bash", "/root/rAthena/boot.sh"]