# Docker commands

## dev

```bash
    docker run -it -p 3000:3000 --entrypoint "rails" connechub server -e development --binding 0.0.0.0
```
## perf

```bash
    docker run -it -p 3000:3000 --entrypoint "rails" connechub server  --binding 0.0.0.0
```

## pro

```bash
    docker run  -p 3000:3000 connechub
```

## Stop RoR

```bash
    docker stop
```

## Push image to AWS ECR

```
    aws ecr get-login --profile connechub --region us-east-1 --no-include-email
    aws ecr get-login --profile connechub --region us-east-1 --no-include-email
    docker login -u AWS -p eyJwYXlsXXXXXXXXXXX== https://345292015349.dkr.ecr.us-east-1.amazonaws.com
    docker tag eaed5c2a90a1 345292015349.dkr.ecr.us-east-1.amazonaws.com/connechub
    docker push 345292015349.dkr.ecr.us-east-1.amazonaws.com/connechub
```
