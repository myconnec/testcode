#!/bin/bash +xe

export $(grep -v '^#' .env | xargs)
printenv | sort | grep APP_*
printenv | sort | grep AWS_*

terraform init
terraform workspace list
terraform workspace new $(whoami)-${APP_ENV}
terraform workspace select $(whoami)-${APP_ENV}
terraform plan --out ./out.plan -var-file=.env
terraform apply -auto-approve -lock=true ./out.plan

./helper_scripts/ansible/init_ec2_provision.sh