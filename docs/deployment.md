# Terraform

## Prerequest
- [Ansible](https://www.ansible.com/) >= 2.7
- [AWS CLI](https://aws.amazon.com/cli/) >= 1.16
- [Terraform](./terraform/install.sh) >= 0.11.11

## Init

* Terraform remote state currently has a bug where it only uses ~/.aws/credentials \[default\] credentials. Please ensure they are valid for the AWS account being used.

load .env k/v's int ENV VAR and esnure they are set.

```sh
export $(grep -v '^#' .env | xargs)
printenv | sort | grep APP_*
printenv | sort | grep AWS_*
```

**Bug**: [Must export the AWS_REGION to the global variables before starting for S3 ACL bucket policies to work. The previouse step has completed this.](https://github.com/terraform-providers/terraform-provider-aws/issues/8560)

Now on to Terraform actions

```sh
terraform init
terraform workspace list
terraform plan --out ./out.plan -var-file=.env
terraform apply -lock=true ./out.plan
```

For development: `Once Terraform sets up the resources, connect to the RDS database and import the starting point data set from ./db/sql/database.sql`

Next, execute Ansible to configure the web app.

```sh
./helper_scripts/ansible/init_ec2_provision.sh
```

For new environments connect to the EC2 instance and execute the import process:

```sh
rake db:setup
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

