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
terraform init
terraform plan --out ./out.plan -var-file=.env
terraform apply -lock=true ./out.plan
```

This is the shell command the main.tf local_exec evaluates to

```bash
./terraform/s3_mount/s3_mount.sh tst media-source media-display
```

## Down

### Dev

```bash
terraform destroy -var-file=.env ./
```
