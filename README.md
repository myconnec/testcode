Connechub


# Infrasstrucuture Configuration

Phase 1:

Make it work

Phase 2:

Make it right

Phase 3:

Make it fast


# Usage

## Up

### Dev

```bash
terraform plan --out ./out.plan -var-file=.env
terraform apply -lock=true ./out.plan
ansible-playbook \
    -i ''$(terraform output EC2_web_host_ip)',' \
    -u ubuntu \
    --extra-vars='{"rd_dns": "'$(terraform output SQL_host_dns_addr)'"}' \
    --private-key ~/.ssh/aws-connechub-test-dje2.pem \
    ./docs/ansible/connechub.yml
```


## Down

### Dev

```bash
terraform destroy -var-file=.env ./
```