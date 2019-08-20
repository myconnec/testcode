# Terraform

## Prerequest
- [Ansible](https://www.ansible.com/) >= 2.7
- [AWS CLI](https://aws.amazon.com/cli/) >= 1.16
- [Terraform](./terraform/install.sh) >= 0.11.11

## Bug

[Must export the AWS_REGION to the global variables before starting for S3 ACL bucket policies to work.](https://github.com/terraform-providers/terraform-provider-aws/issues/8560)

## Init

* Terraform remote state currently has a bug where it only uses ~/.aws/credentials \[default\] credentials. Please ensure they are valid for the AWS account being used.

load .env k/v's int ENV VAR and esnure they are set.

```sh
export $(grep -v '^#' .env | xargs)
printenv | sort | grep APP_*
```

Now on to Terraform actions

```sh
terraform init
terraform workspace list
terraform plan --out ./out.plan -var-file=.env
terraform apply -lock=true ./out.plan
```

For development: `Once Terraform sets up the resources, connect to the RDS database and import the starting point data set.`

Once finished execute the Ansible command to install web app:

```sh
./helper_scripts/ansible_init_provision.sh
```

## Destroy

```sh
terraform destroy -var-file=.env ./
```

## Import Existing Resource

```sh
# tf import varfile location name/arn
terraform import -var-file=.env module.media_storage.aws_s3_bucket.media_display media-display-dev
terraform import -var-file=.env module.media_storage.aws_s3_bucket.media_source media-source-dev
```

## Mark a resource for recreation

```sh
terraform taint -module=web_app aws_instance.web_app
terraform taint -module=web_app aws_eip.web_app
terraform taint -module=media_processing aws_elastictranscoder_pipeline.transcoder_pipeline
```

## Common Errors

E) 'Instance profile already exists': https://github.com/hashicorp/terraform/issues/3749

```sh
aws iam delete-instance-profile --instance-profile-name profile_name_here
```


E) Error creating IAM policy connechub_lambda_logging_www: EntityAlreadyExists: A policy called connechub_lambda_logging_www already exists. Duplicate names are not allowed.

```sh
aws iam delete-policy connechub_lambda_logging_www
```

E) Connection #0 to host media-source-84353407-c9be-f0a5-44c8-651f7942c60f-dev.s3.us-west-1.amazonaws.com left intact
... HTTP response code 403 was returned, returning EPERM': Updated the user access policy to allow access to the new buckets.
