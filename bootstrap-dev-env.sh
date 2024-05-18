#!/bin/bash

# Lista de repositórios para clonar ou atualizar
repos=(
  "git@github.com:produtoreativo/webshop-api.git"
  "git@github.com:produtoreativo/search-api.git"
  "git@github.com:rheckalves/order-mngt-api.git"
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
	if [ "$repo_name" == "order-mngt-api" ]; then
      git checkout 1.0.0
    fi
    cd ..
  else
    # Se não existir, clona o repositório
    echo "Clonando o repositório $repo"
    git clone "$repo"
  fi
done

cd search-api && git checkout melt && cd ..
cd webshop-api && git checkout melt && cd ..
git checkout melt

# Executa o Docker Compose
docker compose -f docker-compose.yml up -d
