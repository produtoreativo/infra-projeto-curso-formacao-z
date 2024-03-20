# Projeto do Curso

Scripts para inicializar o ambiente de desenvolvimento.

## Requisitos
- Docker Desktop
- [Configurações recomendadas para rodar Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/setting-system-settings.html#sysconfig)

## Subindo o ambiente
```sh
$ chmod +x bootstrap-dev-env.sh && ./bootstrap-dev-env.sh
```
## Parando a execução do ambiente
```sh
$ docker compose stop
```
## Destruir o ambiente de dev
```sh
$ docker compose down -v
```