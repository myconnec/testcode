#!/bin/bash +xe

terraform plan --out ./out.plan -var-file=.env
terraform apply -lock=true ./out.plan
