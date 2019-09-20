#!/bin/bash +xe

export $(grep -v '^#' .env | xargs)
printenv | sort | grep APP_*
printenv | sort | grep AWS_*

terraform init
terraform workspace list
terraform workspace select $(whoami)-dev
terraform plan --out ./out.plan -var-file=.env
terraform apply -auto-approve -lock=true ./out.plan

./helper_scripts/ansible/init_ec2_provision.sh
