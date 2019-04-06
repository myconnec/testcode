# Docker commands


## Build

```bash
# MariaDB
docker build -t connechub_mariadb --file ./docker/mariadb/Dockerfile .

# RoR
docker build -t connechub_webapp --file ./docker/rubyonrails/Dockerfile .
```

##  Start

### dev

```bash
# MariaDB
docker run -d -p 3306:3306 \
--mount type=bind,source="$(pwd)"/docker/mariadb/data_dir,target=/var/lib/mysql \
--name mariadb \
--net connechub \
-e MYSQL_ROOT_PASSWORD=password \
-e MYSQL_DATABASE=connechub_dev \
connechub_mariadb:latest

# RoR
docker run -d -it -p 3000:3000 \
--mount type=bind,source="$(pwd)"/,target=/app \
--name connechub_web_app \
--net connechub \
--entrypoint "rails" connechub_webapp:latest server -e development \
--binding 0.0.0.0
```

### tst

```bash
docker run -it -p 3000:3000  --entrypoint "rails" connechub server -e development --binding 0.0.0.0
```

### prf

```bash
docker run -it -p 3000:3000  --entrypoint "rails" connechub server -binding 0.0.0.0
```

## prd

```bash
docker run -it -p 3000:3000  connechub
```

## Other Commands

### Run Rake commands on RoR

```bash
docker exec -it web_app rake db:migrate && rake db:setup
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
