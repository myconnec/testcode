# These values should be populated from the .env using the follow command:
# terraform [comman] [options]] -var-file=.env

variable "APP_ENV" {}
variable "APP_NAME" {}
variable "AWS_REGION" {}
variable "AWS_PEM_KEY_PAIR" {}
variable "AWS_S3_MEDIA_DISPLAY_BUCKET" {}
variable "AWS_S3_MEDIA_SOURCE_BUCKET" {}

variable "compute_size" {
  type    = "string"
  default = "t2.micro"
}
