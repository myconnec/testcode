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
terraform output EC2_web_host_ip
ansible-playbook -i 'PUT_IP_HERE,' -u ubuntu --private-key ~/.ssh/aws-connechub-test-dje2.pem ./docs/ansible/ror.yml
```
