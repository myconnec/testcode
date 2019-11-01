#!/bin/bash +xe
echo 'Cleanning up ConnecHub services...'

docker rm mariadb
docker rm web_app

docker rmi connechub_mariadb:latest
docker rmi connechub_webapp:latest

docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

echo '...completed.'