#!/bin/bash

echo "Construindo o projeto KETERAPI no ambiente de Desenvolvimento..."
mvn clean install -DskipTests > keterapi-build.log 2>&1 &

wait

./mvnw spring-boot:run

#./mvnw spring-boot:run -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"
