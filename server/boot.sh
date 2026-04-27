#!/bin/bash

while ! mysqladmin ping -h db -u ragnarok --password=ragnarok --silent; do
    sleep 1
done

./login-server &
./char-server &
./map-server

wait   # mantém o contêiner vivo enquanto os servidores rodam