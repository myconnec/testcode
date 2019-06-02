variable "APP_ENV" {}
variable "APP_NAME" {}
variable "AWS_REGION" {}
variable "AWS_PEM_KEY_PAIR" {}

variable "COMPUTE_SIZE" {
  type    = "string"
  default = "t2.micro"
}

variable "CONTACT_EMAIL" {
  default = "admin@connechub.com"
  type = "string"
}

variable "DB_USER" {}
variable "DB_PASS" {}
variable "media_display_bucket_id" {}
variable "media_source_bucket_id" {}
