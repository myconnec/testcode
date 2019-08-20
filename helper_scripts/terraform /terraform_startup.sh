#!/bin/bash +xe

export $(grep -v '^#' .env | xargs)
printenv | sort | grep APP_*

terraform init
terraform workspace 
terraform workspace select dje-int
terraform workspace list
terraform plan --out ./out.plan -var-file=.env
terraform apply -auto-approve -lock=true ./out.plan

./helper_scripts/ansible_init_provision.sh
