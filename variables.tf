# These values should be populated from the .env using the follow command:
# terraform [comman] [options]] -var-file=.env
variable "AWS_REGION" {}
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_PEM_KEY_PAIR" {}
variable "DB_USER" {}
variable "DB_PASS" {}