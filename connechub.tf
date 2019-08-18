module "media_storage" {
  source  = "./terraform/media_storage"
  version = "0.3.5"

  APP_ENV                     = "${var.APP_ENV}"
  APP_NAME                    = "${var.APP_NAME}"
  AWS_REGION                  = "${var.AWS_REGION}"
  AWS_S3_MEDIA_DISPLAY_BUCKET = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}"
  AWS_S3_MEDIA_SOURCE_BUCKET  = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}"
  AWS_S3_MEDIA_PROFILE_BUCKET = "${var.AWS_S3_MEDIA_PROFILE_BUCKET}"
  CONTACT_EMAIL               = "${var.CONTACT_EMAIL}"
}

module "media_processing" {
  source  = "./terraform/media_processing"
  version = "0.3.5"

  # variables
  APP_ENV    = "${var.APP_ENV}"
  APP_NAME   = "${var.APP_NAME}"
  AWS_REGION = "${var.AWS_REGION}"

  media_display_bucket_id = "${module.media_storage.media_display_bucket_id}"
  media_source_bucket_id  = "${module.media_storage.media_source_bucket_id}"
}

module "lambda_s3_to_transcoder" {
  source  = "./terraform/lambda_s3_to_transcoder/"
  version = "0.3.5"

  APP_ENV    = "${var.APP_ENV}"
  APP_NAME   = "${var.APP_NAME}"
  AWS_REGION = "${var.AWS_REGION}"

  media_source_bucket_id                = "${module.media_storage.media_source_bucket_id}"
  transcoder_pipeline_id                = "${module.media_processing.transcoder_pipeline_id}"
  video_process_media_source_bucket_arn = "${module.media_storage.media_source_bucket_arn}"
}

module "security" {
  source  = "./terraform/security"
  version = "0.3.5"

  APP_ENV  = "${var.APP_ENV}"
  APP_NAME = "${var.APP_NAME}"

  // this var doesn't do anything inside the module, but it does make this module wait for the DNS record is created BEFORE the TLS cert is created
  web_app_route_53_record = "${module.web_app.route53_record_subdomain_name}"
}

module "web_app" {
  source  = "./terraform/web_app"
  version = "0.3.5"

  APP_ENV          = "${var.APP_ENV}"
  APP_NAME         = "${var.APP_NAME}"
  AWS_REGION       = "${var.AWS_REGION}"
  AWS_PEM_KEY_PAIR = "${var.AWS_PEM_KEY_PAIR}"
  CONTACT_EMAIL    = "${var.CONTACT_EMAIL}"
  DB_USER          = "${var.DB_USER}"
  DB_PASS          = "${var.DB_PASS}"

  media_display_bucket_id = "${module.media_storage.media_display_bucket_id}"
  media_source_bucket_id  = "${module.media_storage.media_source_bucket_id}"

  security_tls_arn = "${module.security.tls_arn}"
}

# Needs RDS host to work, so must be set up after web_app
module "lambda_s3_to_email" {
  source  = "./terraform/lambda_s3_to_email/"
  version = "0.1.0"

  # APP vars
  APP_ENV  = "${var.APP_ENV}"
  APP_NAME = "${var.APP_NAME}"

  # SMTP creds
  SMTP_FROM = "${var.SES_SMTP_SENDER}"
  SMTP_HOST = "${var.SES_SMTP_ADDRESS}"
  SMTP_PASS = "${var.SES_SMTP_PASSWORD}"
  SMTP_PORT = "${var.SES_SMTP_PORT}"
  SMTP_USER = "${var.SES_SMTP_USERNAME}"

  # SQL creds
  SQL_HOST = "${module.web_app.aws_db_instance_rds_address}"
  SQL_PASS = "${var.DB_PASS}"
  SQL_SCHE = "${var.DB_SCHE}"
  SQL_USER = "${var.DB_USER}"

  # AWS Resource
  media_display_bucket_arn = "${module.media_storage.media_display_bucket_arn}"
  media_display_bucket_id  = "${module.media_storage.media_display_bucket_id}"
}

# source https://github.com/cloudposse/terraform-aws-cloudfront-cdn
# module "cdn" {
#   source             = "git::https://github.com/cloudposse/terraform-aws-cloudfront-cdn.git?ref=master"
#   namespace          = "${var.APP_NAME}_${var.APP_ENV}"
#   stage              = "${var.APP_ENV}"
#   name               = "${var.APP_NAME}"
#   origin_https_port = "443"
#   parent_zone_name   = "${var.APP_NAME}.com"
#   origin_domain_name = "origin.${var.APP_NAME}.com"
#   geo_restriction_locations = [
#     "USA"
#   ]
#   geo_restriction_type = "whitelist"
#   aliases            = [
#     "${var.APP_NAME}.com",
#     "www.${var.APP_NAME}.com"
#   ]
# }

