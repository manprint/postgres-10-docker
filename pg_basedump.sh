#!/bin/bash

echo "Script name: pgbasedump full backup"
echo "***********************************"

docker exec --user postgres \
	-it ghcr.io/manprint/postgres10-final:latest \
	pg_basebackup -U postgres \
	-v -P \
	--format=tar \
	--checkpoint=fast \
	--label="$date" \
	--gzip \
	--compress=9 \
	-D /var/lib/postgresql/base/"fullbackup-$(date +'%d_%m_%Y-%H_%M_%S')"/
