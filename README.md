Connechub

# The Game Plan

Phase 1: Make it work

Phase 2: Make it right

Phase 3: Make it fast

# Usage

## Up

### Dev

```bash
terraform init
terraform plan --out ./out.plan -var-file=.env
terraform apply -lock=true ./out.plan
ansible-playbook \
    -i ''"$(terraform output web_app_public_ip)"',' \
    -u ubuntu \
    --extra-vars='{"database_endpoint_dns": "'$(terraform output database_endpoint_dns)'", "app_env": "'$(terraform output app_env)'"}' \
    --private-key ~/.ssh/$(terraform output web_app_key_name).pem \
    ./terraform/web_app/web_app.yml
```

## Down

### Dev

```bash
terraform destroy -var-file=.env ./
```

## Toolchain

- [Ansible](https://www.ansible.com/)
- [AWS CLI](https://aws.amazon.com)
- [Terraform](https://app.terraform.io/app/ConnecHub/workspaces)
- [Ruby on Rails](https://rubyonrails.org/)
