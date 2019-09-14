# New Region Setup

## IAM User, Roles, and Policies

## EC2 PEM key

-

## Create the EC2 web app AMI in AWS region

- [Execute Terraform to setup the ENV.](./terraform/setup.md)
- [Execute Ansible configuration on web app EC2 instance](../helper_scripts/ansible/init_ec2_provision.sh)
- Stop the EC2
- Create AMI from instance
- Update .env with AMI owner ID
- Terraform taint original EC2 instance
- Terraform apply, causing a new EC2 deployment using web app AMI
