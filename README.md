# Postgres 10.13 - Replication Enabled/PITR

## Uso dev

1. Creare una directory per inizializzare il docker di postgres ex: `postgres-docker`
2. Creare all'interno della dir `postgres-docker` la cartella `pgdata`
3. Copiare all'interno della dir `postgres-docker` i seguenti file:
    - postgres-custom-dev.conf
    - postgres-run-dev.sh
4. Dare al file `postgres-custom.conf` i permessi `0600`, `uid=999`, `gid=999`
5. Avviare lo script `postgres-run-dev.sh`
6. Verificare che postgres sia in ascolto su `0.0.0.0:5432`

## Uso prod

1. Creare una directory per inizializzare il docker di postgres ex: `postgres-docker`
2. Creare all'interno della dir `postgres-docker` la cartella `pgdata`, `base`, `wal`
3. Copiare all'interno della dir `postgres-docker` i seguenti file:
    - postgres-custom-prod.conf
    - postgres-run-prod.sh
4. Dare al file `postgres-custom.conf` i permessi `0600`, `uid=999`, `gid=999`
5. Dare alle cartelle `base` e `wal` l'ownership: `uid=999`, `gid=999`
6. Avviare lo script `postgres-run-prod.sh`
7. Verificare che postgres sia in ascolto su `0.0.0.0:5432`