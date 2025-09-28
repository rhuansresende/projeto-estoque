#!/bin/bash

ENV=$1

if [ -z "$ENV" ]; then
  echo "Uso: ./start.sh [dev|hom|prod]"
  exit 1
fi

echo "Subindo ambiente: $ENV"
if ! docker-compose --env-file .env.$ENV up -d --build; then
  echo "Erro ao subir containers para o ambiente '$ENV'"
  exit 1
fi

echo "Aguardando 10 segundos para inicialização..."
sleep 10

echo "Containers iniciados!"
echo "Acesse o sistema em: http://estoque.bs.emporio.com.br/estoque/"
