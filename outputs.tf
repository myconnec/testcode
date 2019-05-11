output "APP_ENV" {
  value = "${var.APP_ENV}"
}

output "AWS_PEM_KEY_PAIR" {
  value = "${var.AWS_PEM_KEY_PAIR}"
}

output "AWS_REGION" {
  value = "${var.AWS_REGION}"
}

output "AWS_S3_MEDIA_DISPLAY_BUCKET" {
  value = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}"
}

output "AWS_S3_MEDIA_SOURCE_BUCKET" {
  value = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}"
}

output "web_app_public_ip" {
  value = "${module.web_app.web_app_public_ip}"
}

output "database_address" {
  value = "${module.web_app.database_address}"
}

output "media_display_bucket_id" {
  value = "${module.media_storage.media_display_bucket_id}"
}

output "media_source_bucket_id" {
    value = "${module.media_storage.media_source_bucket_id}"
}

output "media_source_bucket_arn" {
    value = "${module.media_storage.media_source_bucket_arn}"
}

output "lambda_s3_to_transcoder_s3_to_transcoder_function_name" {
  value = "${module.lambda_s3_to_transcoder.lambda_s3_to_transcoder_s3_to_transcoder_function_name}"
}

output "route53_record_subdomain_name" {
  value = "${module.web_app.route53_record_subdomain_name}"
}
