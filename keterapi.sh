#!/bin/bash

set -e

rm -rf target/

echo "Instalando dependências e construindo o projeto KETERAPI"
mvn clean install -DskipTests -X -U

echo "Executando a aplicação KETERAPI"
java -jar target/keterapi-1.0.0-SNAPSHOT.jar --spring.profiles.active=production

echo "APLICAÇÃO: Sistema Gerenciador de Associados"
echo "VERSÃO: v1.0.0 | PORTA: 8000"
echo "PORTA: 8000"