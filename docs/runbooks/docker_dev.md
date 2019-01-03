# Docker commands

# Ruby on Rails Web App

## build

```bash
    docker build -f ./docker/rubyonrails/Dockerfile . -t connechub:latest
```

## dev

```bash
    docker run -it -p 3000:3000 --entrypoint "rails" --mount type=bind,source="$(pwd)",target=/app --name web_app --net connechub -d connechub:latest server -e development --binding 0.0.0.0
```
## test

```bash
    docker run -p 3000:3000 --entrypoint "rails" --name web_app --rm -d connechub:latest server -e test --binding 0.0.0.0
```

## pro

```bash
    docker run connechub
```

## Stop RoR

```bash
    docker stop
```

## Restart RoR

```bash
    docker start connechub_rubyonrails
```

# AWS Services Integrations

## Push code to AWS CodeCommit

## Push image to AWS ECR

```
    aws ecr get-login --profile connechub --region us-east-1 --no-include-email
    docker login -u AWS -p {provided password} https://{aws account id}.dkr.ecr.us-east-1.amazonaws.com
    docker tag {docker image id} {aws account id}.dkr.ecr.us-east-1.amazonaws.com/connechub
    docker push {docker image id}.dkr.ecr.us-east-1.amazonaws.com/connechub
```

# Maria DB SQL database
## dev

Connection data: 127.0.0.1:3306 root / password

```bash
    docker run --name mariadb --net connechub -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=user -d -p 3306:3306 mariadb:latest
```
