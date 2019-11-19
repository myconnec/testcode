#!/bin/bash -xe
dev_branch=$(git rev-parse --abbrev-ref HEAD)

ssh -i ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem ubuntu@$(terraform output aws_instance_web_app_dns) "\
cd ./connechub \
git checkout $dev_branch --force && git pull origin"

ssh -i ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem ubuntu@$(terraform output aws_instance_web_app_dns)
