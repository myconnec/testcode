# Terraform

## Common Commands

### Init

Terraform remote state currentl has a bug where it only uses ~/.aws/credentials \[default\] credentials. Please ensure they are valid for the AWS account being used.

```bash
terraform init -var-file=.env
```

### Plan

```bash
terraform plan --out ./out.plan -var-file=.env
```

### Apply

```bash
terraform apply -lock=true ./out.plan
```

### Destory

```bash
terraform destroy -var-file=.env ./
```

### Common Errors

'Instance profile already exists': https://github.com/hashicorp/terraform/issues/3749
