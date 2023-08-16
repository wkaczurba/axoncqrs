#!/bin/bash

# Uncomment and execute - one after another...
if [ -d ${PWD}/mysql-mount ]; then
  echo "You need to manually delete ${PWD}/mysql-mount"
fi

# Axon
docker stop axon-server
docker stop mongo-container
docker stop mysql-container
docker stop adminer

set -e
echo Removing containers

docker remove axon-server
docker remove mongo-container
docker remove mysql-container
docker remove adminer

docker network rm springbankNet
