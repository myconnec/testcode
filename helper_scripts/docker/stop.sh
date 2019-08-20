#!/bin/bash +xe
echo 'Stopping ConnecHub services...'

docker stop mariadb
docker stop web_app

echo '...completed.'
