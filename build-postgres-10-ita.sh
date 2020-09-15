#!/bin/bash

echo "Script name: build postgres 10 final ita"
echo "****************************************"

docker build --tag ghcr.io/manprint/postgres10-final:latest .