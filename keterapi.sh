#!/bin/bash

set -e

rm -rf target/

echo "Construindo o projeto KETERAPI..."
mvn clean install -DskipTests > build.log 2>&1 &

wait

echo "APLICAÇÃO: Sistema Gerenciador de Associados"
echo "VERSÃO: v1.0.0 | PORTA: 8000"
java -jar target/keterapi-1.0.0-SNAPSHOT.jar --spring.profiles.active=production