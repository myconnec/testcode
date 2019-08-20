#!/bin/bash -xe

terraform destroy -auto-approve -var-file=.env ./
