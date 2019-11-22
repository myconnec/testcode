#!/bin/bash

export $(grep -v '^#' .env | xargs)

terraform destroy -auto-approve -var-file=.env ./
