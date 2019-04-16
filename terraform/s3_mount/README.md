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
    -i '3.14.11.54,' \
    -u ubuntu \
    --private-key ~/.ssh/aws-connechub-test-dje.pem \
    ./ansible/s3_mount.yml
```


## Down

### Dev

```bash
terraform destroy -var-file=.env ./
```
