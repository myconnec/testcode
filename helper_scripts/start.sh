#!/bin/bash +xe
echo 'Startig ConnecHub services...'

echo '...starting SQL container.'
docker run -d -p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=password \
-e MYSQL_DATABASE=connechub \
--cpus=1 \
--memory=512M \
--name mariadb \
--rm \
connechub_mariadb:latest

echo '...starting web app container.'
docker run -d -it -p 80:9293 \
--cap-add SYS_ADMIN \
--cpus=1 \
--device /dev/fuse \
--memory=512M \
--mount type=bind,source="$(pwd)"/,target=/app \
--name web_app \
--rm \
connechub_webapp:latest

echo '...waiting for services to start up.'
secs=$((5))
while [ $secs -gt 0 ]; do
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done

echo '...load SQL schema source with seed data.'
docker exec -it web_app rake db:schema:load
docker exec -it web_app rake db:seed
docker exec -it web_app rake db:migrate

echo '...completed.'
