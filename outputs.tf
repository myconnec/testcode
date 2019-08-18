output "APP_ENV" {
  value = "${var.APP_ENV}"
}

output "APP_NAME" {
  value = "${var.APP_NAME}"
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

output "AWS_S3_MEDIA_PROFILE_BUCKET" {
  value = "${var.AWS_S3_MEDIA_PROFILE_BUCKET}"
}

output "database_address" {
  value = "${module.web_app.database_address}"
}

output "aws_instance_web_app_dns" {
  value = "${module.web_app.aws_instance_web_app_dns}"
}

output "media_display_bucket_id" {
  value = "${module.media_storage.media_display_bucket_id}"
}

output "media_display_bucket_arn" {
  value = "${module.media_storage.media_display_bucket_arn}"
}

output "media_source_bucket_id" {
  value = "${module.media_storage.media_source_bucket_id}"
}

output "media_source_bucket_arn" {
  value = "${module.media_storage.media_source_bucket_arn}"
}

output "media_profile_bucket_id" {
  value = "${module.media_storage.media_profile_bucket_id}"
}

output "media_profile_bucket_arn" {
  value = "${module.media_storage.media_profile_bucket_arn}"
}

output "lambda_s3_to_transcoder_lambda_function_name" {
  value = "${module.lambda_s3_to_transcoder.lambda_s3_to_transcoder_lambda_function_name}"
}

output "route53_record_subdomain_name" {
  value = "${module.web_app.route53_record_subdomain_name}"
}

output "security_tls_arn" {
  value = "${module.security.tls_arn}"
}

output "security_tls_domain_name" {
  value = "${module.security.tls_domain_name}"
}

output "ec2_public_dns" {
  value = "${module.web_app.ec2_public_dns}"
}
