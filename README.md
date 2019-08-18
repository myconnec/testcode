# Connechub

## The Game Plan

Phase 1: Make it work <- we are here

Phase 2: Make it right

Phase 3: Make it fast

## Toolchain

- [Ansible](https://www.ansible.com/)
- [AWS CLI](https://aws.amazon.com)
- [Terraform](https://app.terraform.io/app/ConnecHub/workspaces)
- [Ruby on Rails](https://rubyonrails.org/)
- [Puma](https://github.com/puma/puma) webserver

... also check Gemfile for version of dependencies.

- [CH Docker usage](./docs/docker/NOTES.md)
- [Lighthouse Perf. reports](./docs/lighthouse)
- [POSTman Documents](./docs/POSTman)
- [Production Deployment Process](./docs/production/NOTES.md)
- [Terraform Operations](./docs/terraform/NOTES.md)

## Deployment process

- ./helper_scripts/load_vars.sh - Load .env into ENV VAR for use by later tooling

```sh
./helper_scripts/
```

- Packler - build AMI 
  - Ansible to provision base configuration

```sh
packer build ./packer/build_ami.json
```

- Terraform - Stand up Resoures
  - Ansible to provision updates

```sh
terraform init
terraform workspace list
terraform plan
terraform apply
```

On initial setup of the environment you need to update the .env config stored in the S3 bucket with then FQDN of the database. Then `terraform tain` the EC2 instance and re-provision it with `terraform plan && terraform apply`.

- AWS EC2 user_data - startup logic

```sh
Copy .env
Update 
Run migrations
Start web server
```
