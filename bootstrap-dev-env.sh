#!/bin/bash

# Lista de repositórios para clonar ou atualizar
repos=(
  "git@github.com:produtoreativo/webshop-api.git"
  "git@github.com:produtoreativo/search-api.git"
  "git@github.com:produtoreativo/order-mngt-api.git"
  "git@github.com:produtoreativo/payments.git"
  )

for repo in "${repos[@]}"
do
  # Extrai o nome do repositório da URL
  repo_name=$(basename "$repo" .git)

  # Verifica se o diretório do repositório já existe
  if [ -d "$repo_name" ]; then
    # Se existir, atualiza o repositório
    echo "Atualizando o repositório $repo_name"
    cd "$repo_name"
    git pull
    cd ..
  else
    # Se não existir, clona o repositório
    echo "Clonando o repositório $repo"
    git clone "$repo"
  fi
done

# Executa o Docker Compose
docker compose -f docker-compose.yml up -d
