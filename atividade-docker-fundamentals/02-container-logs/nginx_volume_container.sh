#!/bin/bash

NOME="juda"
VOLUME_NAME="nginx_$NOME"
CONTAINER_NAME="nginx_logs_test"

echo "==> 1. Criando volume Docker chamado $VOLUME_NAME..."
docker volume create $VOLUME_NAME

echo "==> 2. Executando contêiner nginx com volume montado e porta 8080 exposta..."
docker run -d \
  --name $CONTAINER_NAME \
  -p 8080:80 \
  -v $VOLUME_NAME:/var/log/nginx \
  nginx

sleep 3  # Aguarda alguns segundos para o nginx iniciar

echo "==> 3. Gerando logs acessando a página com curl..."
curl http://localhost:8080

sleep 1  # Aguarda geração de logs

echo "==> 4. Parando e removendo o contêiner..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo "==> 5. Criando novo contêiner e validando logs antigos..."
docker run -d \
  --name $CONTAINER_NAME \
  -p 8080:80 \
  -v $VOLUME_NAME:/var/log/nginx \
  nginx

sleep 3
echo '==> Logs persistidos no volume'
docker exec $CONTAINER_NAME ls -l /var/log/nginx
docker exec $CONTAINER_NAME cat /var/log/nginx/access.log


