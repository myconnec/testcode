# Terraform

## Prerequest
- [Ansible](https://www.ansible.com/) >= 2.7
- [AWS CLI](https://aws.amazon.com/cli/) >= 1.16
- [Terraform](./terraform/install.sh) >= 0.11.11

## Bug

[Must export the AWS_REGION to the global variables before starting for S3 ACL bucket policies to work.](https://github.com/terraform-providers/terraform-provider-aws/issues/8560)

## Init

Terraform remote state currentl has a bug where it only uses ~/.aws/credentials \[default\] credentials. Please ensure they are valid for the AWS account being used.

```bash
cd ./terraform/lambda_s3_to_transcoder/lambda_source/
zip index.js.zip index.js
cd ../../../
export AWS_REGION=YOUR_REGION_HERE
terraform init
```

## Plan

```bash
terraform workspace select dev # lcl, dev, prd
terraform plan --out ./out.plan -var-file=.env
```

## Apply

```bash
terraform apply -lock=true ./out.plan
```

Once finished execute the Ansible command to install web app:

```bash
./terraform/web_app/web_app.sh \
    $(terraform output web_app_public_ip) \
    $(terraform output APP_ENV) \
    $(terraform output APP_NAME) \
    $(terraform output AWS_REGION) \
    $(terraform output media_display_bucket_id) \
    $(terraform output media_source_bucket_id) \
    $(terraform output database_address) \
    $(terraform output AWS_PEM_KEY_PAIR)
```

## Mark a resource for recreation

```bash
terraform taint -module=web_app aws_instance.web_app && terraform taint -module=web_app aws_eip.web_app
terraform taint -module=lambda_s3_to_transcoder aws_lambda_function.s3_to_transcoder
```

## Destroy

```bash
terraform destroy -var-file=.env ./
```

## Common Errors

'Instance profile already exists': https://github.com/hashicorp/terraform/issues/3749
