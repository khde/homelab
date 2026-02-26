#!/bin/bash
set -e

echo "DEBUG ================================================="
echo "POSTGRES_USER     = [$POSTGRES_USER]"
echo "POSTGRES_PASSWORD = [$POSTGRES_PASSWORD]"   # password will be visible in logs!
echo ""
echo "NPM_DB_USER       = [$NPM_DB_USER]"
echo "NPM_DB_PASSWORD   = [$NPM_DB_PASSWORD]"
echo "NPM_DB_NAME       = [$NPM_DB_NAME]"
echo ""
echo "NEXTCLOUD_DB_USER     = [$NEXTCLOUD_DB_USER]"
echo "NEXTCLOUD_DB_PASSWORD = [$NEXTCLOUD_DB_PASSWORD]"
echo "NEXTCLOUD_DB_NAME     = [$NEXTCLOUD_DB_NAME]"
echo ""
echo "GITEA_DB_USER     = [$GITEA_DB_USER]"
echo "GITEA_DB_PASSWORD = [$GITEA_DB_PASSWORD]"
echo "GITEA_DB_NAME     = [$GITEA_DB_NAME]"
echo "======================================================="

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_USER" <<-EOSQL

    -- NPM
    CREATE USER "${NPM_DB_USER}" WITH PASSWORD '${NPM_DB_PASSWORD}';
    CREATE DATABASE "${NPM_DB_NAME}" OWNER "${NPM_DB_USER}";

    -- Nextcloud
    CREATE USER "${NEXTCLOUD_DB_USER}" WITH PASSWORD '${NEXTCLOUD_DB_PASSWORD}';
    CREATE DATABASE "${NEXTCLOUD_DB_NAME}" OWNER "${NEXTCLOUD_DB_USER}";

    -- Gitea
    CREATE USER "${GITEA_DB_USER}" WITH PASSWORD '${GITEA_DB_PASSWORD}';
    CREATE DATABASE "${GITEA_DB_NAME}" OWNER "${GITEA_DB_USER}";

EOSQL
