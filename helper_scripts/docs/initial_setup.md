# New Region Setup

## IAM User, Roles, and Policies

## EC2 PEM key

-

## Create the EC2 web app AMI in AWS region

- [Execute Terraform to setup the ENV.](./terraform/setup.md)
- [Execute Ansible configuration on web app EC2 instance](../helper_scripts/ansible/init_ec2_provision.sh)
- Stop the EC2 instance

```sh
aws stop-instance ${terraform output web_app_ec2_id}
```

- Run

- Restart the instance with

```sh
aws start-instance ${terraform output web_app_ec2_id}
```

- Terraform existing web app EC2 instance

```sh
terraform taint -module=web_app aws_instance.web_app
```

- Update infrastrucuture to replace any old/pre-existing instance with the new AMI based instance
