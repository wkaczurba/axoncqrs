#!/bin/bash

set -e
# Uncomment and execute - one after another...

if [[ $(docker network ls | grep springbankNet | wc -l) -ne 1 ]]; then
  docker network create --attachable -d overlay springbankNet
fi
# Axon
docker run -d --name axon-server -p 8024:8024 -p 8124:8124 --network springbankNet --restart always axoniq/axonserver:latest

# Mongo DB:
docker run -it -d --name mongo-container -p 27017:27017 --network springbankNet --restart always -v mongodb_data_container:/data/db mongo:latest

# MySQL:
docker run -it -d --name mysql-container -p 3306:3306 --network springbankNet -e MYSQL_ROOT_PASSWORD=springbankNetPsw --restart always -v mysql_data_container:${PWD}/mysql-mount mysql:latest

# MySQL - adminer:
docker run -it -d --name adminer -p 8080:8080 --network springbankNet -e ADMINER_DEFAULT_SERVER=mysql-container --restart always adminer:latest

# Testing the connectivity:
# docker run --net springbankNet busybox ping mysql-container