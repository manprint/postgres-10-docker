#!/bin/bash

echo "Script name: run postgres 10.13 ita"
echo "***********************************"

docker run \
	-d \
	-p 5432:5432 \
	-e POSTGRES_USER=postgres \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_DB=postgres \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v "$(pwd)"/postgres-custom-prod.conf:/etc/postgresql/postgresql.conf:rw \
 	-v "$(pwd)"/pgdata:/var/lib/postgresql/data:rw \
	-v "$(pwd)"/wal:/var/lib/postgresql/wal:rw \
	-v "$(pwd)"/base:/var/lib/postgresql/base:rw \
	--name postgres-10.13-ita \
    ghcr.io/manprint/postgres10-final:latest \
    -c 'config_file=/etc/postgresql/postgresql.conf'
