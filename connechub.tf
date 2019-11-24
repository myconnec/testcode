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

module "security" {
  source  = "./terraform/security"
  version = "0.3.5"

  APP_ENV  = "${var.APP_ENV}"
  APP_NAME = "${var.APP_NAME}"
  CONTACT_EMAIL = "${var.CONTACT_EMAIL}"

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

# Needs RDS host to work, so must be set up after web_app
module "lambda_s3_to_email" {
  source  = "./terraform/lambda_s3_to_email/"
  version = "0.1.0"

  # APP vars
  APP_ENV    = "${var.APP_ENV}"
  APP_NAME   = "${var.APP_NAME}"
  AWS_REGION = "${var.AWS_REGION}"

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

module "lambda_s3_to_promo" {
  source  = "./terraform/lambda_s3_to_promo/"
  version = "0.0.2"

  # APP vars
  APP_ENV    = "${var.APP_ENV}"
  APP_NAME   = "${var.APP_NAME}"
  AWS_REGION = "${var.AWS_REGION}"

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
#   source = "git::https://github.com/cloudposse/terraform-aws-cloudfront-cdn.git?ref=master"

#   attributes = ["${var.APP_NAME}.com"]
#   name       = "${var.APP_NAME}"
#   namespace  = "${var.APP_NAME}"
#   stage      = "${var.APP_ENV}"

#   acm_certificate_arn    = "${module.security.tls_cf_arn}"
#   aliases                = ["${var.APP_ENV}.${var.APP_NAME}.com"]
#   allowed_methods        = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
#   cached_methods         = ["GET", "HEAD"]
#   compress               = "true"
#   default_root_object    = ""
#   default_ttl            = 60
#   forward_cookies        = "all"
#   forward_headers        = ["*"]
#   forward_query_string   = "true"
#   max_ttl                = 86400
#   min_ttl                = 0
#   origin_domain_name     = "${var.APP_ENV}.${var.APP_NAME}.com"
#   origin_protocol_policy = "match-viewer"
#   parent_zone_name       = "${var.APP_NAME}.com"
#   price_class            = "PriceClass_All"
#   viewer_protocol_policy = "redirect-to-https"
#   geo_restriction_locations = ["US"]
#   geo_restriction_type = "whitelist"
# }
