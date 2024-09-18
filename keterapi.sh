#!/bin/bash

set -e

echo "Clonando o repositório..."
git clone https://github.com/josequintinno/keterapi.git

echo "Acessando o Diretório..."
cd keterapi

rm -rf target/

echo "Instalando dependências e construindo o projeto..."
mvn clean install -DskipTests -X -U

echo "Executando a aplicação..."
java -jar target/keterapi-1.0.0-SNAPSHOT.jar --spring.profiles.active=production