#!/bin/bash

set -e

rm -rf target/

echo "Construindo o projeto KETERAPI..."
mvn clean install -DskipTests > build.log 2>&1 &

wait

if [ -f target/keterapi-1.0.0-SNAPSHOT.jar ]; then
    echo "Executando a aplicação KETERAPI..."
    java -jar target/keterapi-1.0.0-SNAPSHOT.jar --spring.profiles.active=production
    echo "APLICAÇÃO: Sistema Gerenciador de Associados"
    echo "VERSÃO: v1.0.0 | PORTA: 8000"
else
    echo "Erro: O arquivo JAR não foi encontrado."
    exit 1
fi