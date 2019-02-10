#!/bin/bash -e

export RAILS_ENV='development'

# build image/s
# mariaDB
docker build -t connechub_mariadb --file ./docker/mariadb/Dockerfile .
# ror
docker build -t connechub_webapp --file ./docker/rubyonrails/Dockerfile .

# ENV config
if [ ! -f .env ]; then
    cp .env.dist .env

    vim .env
fi

# set RAILS_ENV
if [ -z ${RAILS_ENV} ]; then
    export RAILS_ENV='development'
fi

# create network
docker network create connechub || true

# start services in DEV config
# mariadb
docker run -d -p 3306:3306 \
--mount type=bind,source="$(pwd)"/docker/mariadb/data_dir,target=/var/lib/mysql \
--name mariadb \
--net connechub \
-e MYSQL_ROOT_PASSWORD=root \
-e MYSQL_DATABASE=connechub_dev \
connechub_mariadb:latest

# RoR
docker run -d -it -p 3000:3000 \
--mount type=bind,source="$(pwd)"/,target=/app \
--name web_app \
--net connechub \
--entrypoint "rails" connechub_webapp:latest server -e development \
--binding 0.0.0.0

# Run install DB migrations
docker exec web_app ./bin/rake db:setup RAILS_ENV=${RAILS_ENV}
docker exec web_app ./bin/rake db:migrate RAILS_ENV=${RAILS_ENV}
