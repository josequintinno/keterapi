#!/bin/bash

set -e  # Faz com que o script pare se algum comando falhar

echo "Navegando para o diretório de aplicações..."
cd /data/data/com.termux/files/home/application

echo "Clonando o repositório..."
git clone https://github.com/josequintinno/keterapi.git

echo "Acessando o Diretório..."
cd keterapi

echo "Instalando dependências e construindo o projeto..."
mvn clean install -DskipTests -X -U

echo "Executando a aplicação..."
java -jar target/keterapi-1.0.0-SNAPSHOT.jar --spring.profiles.active=production