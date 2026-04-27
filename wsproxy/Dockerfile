###########################################################################
#
# Dockerfile - wsproxy
#
###########################################################################

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependências necessárias
RUN apt-get update && apt-get install -y \
    dos2unix \
    npm \
    netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instala o wsproxy globalmente
RUN npm install -g wsproxy

# Copia o script de inicialização
COPY boot.sh /root/boot.sh

WORKDIR /root

# Corrige final de linha + permissão
RUN dos2unix /root/boot.sh
RUN chmod +x /root/boot.sh

# Inicialização mais confiável
ENTRYPOINT ["/bin/bash", "/root/boot.sh"]