#!/bin/bash +xe

terraform plan --out ./out.plan -var-file=.env
terraform apply -lock=true ./out.plan

./terraform/web_app/web_app.sh \
    $(terraform output ec2_public_dns) \
    $(terraform output APP_ENV) \
    $(terraform output APP_NAME) \
    $(terraform output AWS_REGION) \
    $(terraform output media_display_bucket_id) \
    $(terraform output media_source_bucket_id) \
    $(terraform output database_address) \
    $(terraform output AWS_PEM_KEY_PAIR)
