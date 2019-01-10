# Docker commands


## build

```bash
    docker build -t connechub --file ./docker/Dockerfile .
```

## dev

```bash
    docker run -it -p 3000:3000 --mount type=bind,source="$(pwd)"/,target=/app --entrypoint "rails" connechub server -e development --binding 0.0.0.0
```

## perf

```bash
    docker run -it -p 3000:3000  --entrypoint "rails" connechub server -binding 0.0.0.0
```

## pro

```bash
    docker run -it -p 3000:3000  connechub
```

## Stop RoR

```bash
    docker stop
```

## Push image to AWS ECR

```bash
    aws ecr get-login --profile connechub --region us-east-1 --no-include-email
    docker login -u AWS -p {provided password} https://{aws account id}.dkr.ecr.us-east-1.amazonaws.com
    docker tag {docker image id} {aws account id}.dkr.ecr.us-east-1.amazonaws.com/connechub
    docker push {docker image id}.dkr.ecr.us-east-1.amazonaws.com/connechub
```
