#!/bin/bash +xe

export $(grep -v '^#' .env | xargs)
printenv | sort | grep APP_*
printenv | sort | grep AWS_*

terraform init
terraform workspace list
terraform workspace select dje-dev
terraform plan --out ./out.plan -var-file=.env
terraform apply -auto-approve -lock=true ./out.plan

./helper_scripts/ansible_init_provision.sh
