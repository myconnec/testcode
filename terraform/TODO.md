# To Do

## Abstract

Abstract the modules based on AWS service uses. Thec ommnity has chosen this route as per the design patterns observed @ https://registry.terraform.io/browse?provider=aws

## Module strucutures

```bash
| terraform
| - aws
| - - ec2
| - - - variables.tf
| - - - main.tf
| - - - other_1.tf
| - - - other_2.tf
| - - - outputs.tf
| - - s3
| - - - variables.tf
| - - - main.tf
| - - - other_1.tf
| - - - other_2.tf
| - - - outputs.tf
| - - load_balancer
| - - - variables.tf
| - - - main.tf
| - - - other_1.tf
| - - - other_2.tf
| - - - outputs.tf
...
```
