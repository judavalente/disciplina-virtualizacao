#!/bin/bash

# Baixa a imagem do nginx
echo "Baixando a imagem nginx..."
docker pull nginx

# Inicia um contêiner nginx com o nome 'meu-servidor'
echo "Iniciando o contêiner nginx com nome 'meu-servidor'..."
docker run -d --name meu-servidor nginx

# Lista todos os contêineres em execução
echo "Listando contêineres em execução..."
docker ps

# Para o contêiner
echo "Parando o contêiner 'meu-servidor'..."
docker stop meu-servidor

# Remove o contêiner
echo "Removendo o contêiner 'meu-servidor'..."
docker rm meu-servidor

# Lista todos os contêineres (inclusive os parados)
echo "Listando todos os contêineres (inclusive os parados)."
