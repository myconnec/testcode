# Docker commands


## build

```bash
docker build -t connechub --file ./docker/rubyonrails/Dockerfile .
```

## Container Start

### dev

```bash
docker run -d -it -p 3000:3000 \
--mount type=bind,source="$(pwd)"/,target=/app \
--name web_app \
--net connechub \
--entrypoint "rails" connechub:latest server -e development \
--binding 0.0.0.0
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

```bash

```

## Stop

### Ruby on Rails

```bash
docker stop
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
