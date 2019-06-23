# Docker commands

## Build

```bash
# export current APP_ENV, should be the same from .env file
docker network create connechub
```

```bash
# Stripe-Mock
docker run --name stripe_mock --rm -d -p 12111-12112:12111-12112 stripe-mock

# MariaDB
docker build -t connechub_mariadb --file ./docker/mariadb/Dockerfile .

# RoR
docker build -t  connechub_webapp --file ./docker/rubyonrails/Dockerfile .
```

##  Start

### dev

```bash
# MariaDB, limit hardware to simulate a small cloud instance
docker run -d -p 3306:3306 \
--cpus=1 \
-e MYSQL_ROOT_PASSWORD=password \
-e MYSQL_DATABASE=connechub_dev \
--memory=512M \
--name mariadb \
--net connechub \
connechub_mariadb:latest

--mount type=bind,source="$(pwd)"/docker/mariadb/data_dir,target=/var/lib/mysql \
--mount type=bind,source="$(pwd)"/docker/mariadb/my.cnf,target=/etc/mysql/my.cnf \

# RoR, limit hardwar to simulate a small cloud instance
docker run -d -it -p 3000:3000 \
--cap-add SYS_ADMIN \
--cpus=1 \
--device /dev/fuse \
--memory=512M \
--mount type=bind,source="$(pwd)"/,target=/app \
--name web_app \
--net connechub \
--entrypoint "rails" connechub_webapp:latest server -e development \
--binding 0.0.0.0

# Create local DIR and mount S3 Buckets in running container
# source
docker exec web_app mkdir media-source-${APP_ENV}
docker exec web_app s3fs \
    -d \
    media-source-84353407-c9be-f0a5-44c8-651f7942c60f-${APP_ENV} \
    media-source-${APP_ENV} \
    -o endpoint=us-east-1 \
    -o use_cache=/tmp \
    -o multireq_max=5 \
    -o passwd_file=/app/.passwd-s3fs  \
    -o url=https://s3.${AWS_REGION}.amazonaws.com \
    -o nonempty \
    -o allow_other

# display
docker exec web_app mkdir /app/public/system
docker exec web_app s3fs \
    -d \
    media-display-${APP_ENV} \
    /app/public/system \
    -o endpoint=us-east-1 \
    -o use_cache=/tmp \
    -o multireq_max=5 \
    -o passwd_file=/app/.passwd-s3fs  \
    -o url=https://s3.${AWS_REGION}.amazonaws.com \
    -o nonempty \
    -o allow_other
```

### test

```bash
docker run -it -p 3000:3000  --entrypoint "rails" connechub server -e development --binding 0.0.0.0
```

### perf

```bash
docker run -it -p 3000:3000  --entrypoint "rails" connechub server -binding 0.0.0.0
```

## pro

```bash
docker run -it -p 3000:3000  connechub
```

## Other Commands

### Run Rake commands on RoR

Load from blank:

```bash
docker exec -it web_app rake db:setup
```

```bash
docker exec -it web_app rake db:schema:load
```

```bash
docker exec -it web_app rake db:migrate
```

Use the database.sql SQL dump to __seed__ the database with data.

```bash
docker exec -it web_app rake db:seed
```

## Stop

### Ruby on Rails

```bash
docker stop web_app
```

Clean up untagged images and stopped containers

```bash
docker rm $(docker ps -a -q) # remove stopped containers
docker rmi $(docker images | grep "^<none>" | awk "{print $3}") # remove untagged images
# OR
docker container prune # remove stopped containers
```

## Push Image

### AWS ECR

```bash
aws ecr get-login --profile connechub --region us-east-1 --no-include-email
docker login -u AWS -p {provided password} https://{aws account id}.dkr.ecr.us-east-1.amazonaws.com
docker tag {docker image id} {aws account id}.dkr.ecr.us-east-1.amazonaws.com/connechub
docker push {docker image id}.dkr.ecr.us-east-1.amazonaws.com/connechub
```
