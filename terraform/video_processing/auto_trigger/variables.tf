# These values should be populated from the .env using the follow command:
# terraform [comman] [options]] -var-file=.env

variable "APP_ENV" {}

variable "APP_NAME" {}

variable "AWS_REGION" {}

variable "SOURCE_BUCKET" {}

variable "TRANSCODER" {}
