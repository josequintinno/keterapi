#!/bin/bash

set -e

rm -rf target/

echo "Instalando dependências e construindo o projeto KETERAPI"
mvn clean install -DskipTests -X -U

if [ -f target/keterapi-1.0.0-SNAPSHOT.jar ]; then
    echo "Executando a aplicação KETERAPI..."
    java -jar target/keterapi-1.0.0-SNAPSHOT.jar --spring.profiles.active=production
else
    echo "Erro: O arquivo JAR não foi encontrado. Certifique-se de que a construção foi bem-sucedida."
    exit 1
fi

echo "Executando a aplicação KETERAPI"
java -jar target/keterapi-1.0.0-SNAPSHOT.jar --spring.profiles.active=production

echo "APLICAÇÃO: Sistema Gerenciador de Associados"
echo "VERSÃO: v1.0.0 | PORTA: 8000"