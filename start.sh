#!/bin/bash
# Script para iniciar o sistema de estoque

echo "Iniciando containers Docker..."
docker-compose build --no-cache backend
docker-compose up -d

echo "Aguardando 10 segundos para inicialização..."
sleep 10

echo "Containers iniciados!"
echo "Acesse o sistema em: http://estoque.bs.emporio.com.br:4200/estoque/"
