#!/bin/bash

set -e

rm -rf target/

echo "Construindo o projeto KETERAPI..."
mvn clean install -DskipTests > build.log 2>&1 &

wait

IP=$(ip -4 addr show scope global | awk '/inet / {print $2}' | cut -d/ -f1 | head -n1)
DATA_HORA=$(date +"%d/%m/%Y %H:%M:%S")

echo "APLICAÇÃO: KETER: Sistema Gerenciador de Associados"
echo "VERSÃO: v1.0.0"
echo "URL: http://$IP:8000/api/v1/"
echo "DATA: $DATA_HORA"
java -jar target/keterapi-1.0.0-SNAPSHOT.jar --spring.profiles.active=production