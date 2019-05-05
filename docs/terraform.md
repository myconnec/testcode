# Terraform

## Prerequest
- [Ansible]() >= 2.7
- [AWS CLI]()
- [Terraform]() >= 0.11.3


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
        "app_env": "'$(terraform output app_env)'",
        "database_endpoint_dns": "'$(terraform output database_endpoint_dns)'",
    }' \
    --private-key ~/.ssh/$(terraform output web_app_key_name).pem \
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
