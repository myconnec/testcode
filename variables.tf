# These values should be populated from the .env using the follow command:
# terraform [comman] [options]] -var-file=.env

variable "APP_ENV" {}
variable "APP_HOST" {}
variable "APP_NAME" {}
variable "AWS_REGION" {}
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_PEM_KEY_PAIR" {}
variable "CONTACT_EMAIL" {}
variable "DB_USER" {}
variable "DB_PASS" {}
variable "AWS_S3_MEDIA_DISPLAY_BUCKET" {}
variable "AWS_S3_MEDIA_SOURCE_BUCKET" {}
