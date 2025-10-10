#!/bin/bash

cd services
docker compose -f ./postgresql/docker-compose.yml up -d
docker compose -f ./keycloak/docker-compose.yml up -d
docker compose -f ./pgadmin/docker-compose.yml up -d
docker compose -f ./gitea/docker-compose.yml up -d
docker compose -f ./nextcloud/docker-compose.yml up -d

docker ps -a
