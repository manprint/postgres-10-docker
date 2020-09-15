#!/bin/bash

echo "Script name: run postgres 10.13 ita"
echo "***********************************"

docker run \
	-dit \
	-p 5432:5432 \
	-e POSTGRES_USER=postgres \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_DB=postgres \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v "$(pwd)"/pgdata:/var/lib/postgresql/data:rw \
	-v "$(pwd)"/postgres-custom-dev.conf:/etc/postgresql/postgresql.conf:rw \
	--name postgres-10.13-ita \
    ghcr.io/manprint/postgres10-final:latest \
    -c 'config_file=/etc/postgresql/postgresql.conf'
