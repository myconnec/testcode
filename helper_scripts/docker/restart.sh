#!/bin/bash +xe
echo 'Restartig ConnecHub services...'

docker restart mariadb
docker restart web_app
