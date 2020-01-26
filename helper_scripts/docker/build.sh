#!/bin/bash +xe
echo 'Building ConnecHub services...'

echo  'Tool locations...'
which docker

echo '...build images for SQL and web services.'
docker build -t connechub_mariadb --file ./docker/mariadb/Dockerfile .
docker build -t connechub_webapp --file ./docker/rubyonrails/Dockerfile .

echo '...completed.'
