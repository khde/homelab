#!/bin/bash

# Default to "up" if no argument is provided
ACTION=${1:-up}

cd services || exit 1

if [ "$ACTION" = "up" ]; then
  FLAG="-d"
else
  FLAG=""
fi

docker compose -f ./postgresql/docker-compose.yml "$ACTION" $FLAG
docker compose -f ./keycloak/docker-compose.yml "$ACTION" $FLAG
docker compose -f ./homepage/docker-compose.yml "$ACTION" $FLAG
docker compose -f ./pgadmin/docker-compose.yml "$ACTION" $FLAG
docker compose -f ./gitea/docker-compose.yml "$ACTION" $FLAG
docker compose -f ./nextcloud/docker-compose.yml "$ACTION" $FLAG

docker ps -a

