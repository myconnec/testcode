variable "APP_ENV" {}
variable "STAGE" {}
variable "AWS_REGION" {}
variable "AWS_PEM_KEY_PAIR" {}

variable "COMPUTE_SIZE" {
  type    = "string"
  default = "t2.micro"
}

variable "CONTACT_EMAIL" {}
variable "RDS_DB_USER" {}
variable "RDS_DB_PASS" {}
variable "media_display_bucket_id" {}
variable "media_source_bucket_id" {}

variable "security_tls_arn" {}
