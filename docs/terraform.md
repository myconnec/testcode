# Terraform

## Prerequest
- [Ansible]() >= 2.7
- [AWS CLI]()
- [Terraform](./terraform/install.sh) >= 0.11.11


## Init

Terraform remote state currentl has a bug where it only uses ~/.aws/credentials \[default\] credentials. Please ensure they are valid for the AWS account being used.

```bash
terraform init
```

## Plan

```bash
terraform plan --out ./out.plan -var-file=.env
```

## Apply

```bash
terraform apply -lock=true ./out.plan
ansible-playbook \
    -i ''"$(terraform output web_app_public_ip)"',' \
    -u ubuntu \
    --extra-vars='{
        "APP_ENV": "'$(terraform output APP_ENV)'",
        "AWS_REGION": "'$(terraform output APP_REGION)'",
        "AWS_S3_MEDIA_DISPLAY_BUCKET": "'$(terraform output AWS_S3_MEDIA_DISPLAY_BUCKET)'",
        "AWS_S3_MEDIA_SOURCE_BUCKET": "'$(terraform output AWS_S3_MEDIA_SOURCE_BUCKET)'",
        "database_address": "'$(terraform output database_address)'"
    }' \
    --private-key ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem \
    ./terraform/web_app/web_app.yml
```

## Destroy
```bash
terraform destroy -var-file=.env ./
```

## Common Errors

'Instance profile already exists': https://github.com/hashicorp/terraform/issues/3749

## TODO

Use most recent prod snapshot. source https://medium.com/@vankhoa011/how-i-use-terraform-to-restore-the-latest-snapshot-from-productions-db-to-staging-s-db-aws-rds-6ad4f6620df2
