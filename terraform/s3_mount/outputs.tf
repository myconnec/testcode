output "EC2_web_host_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "AWS_S3_MEDIA_SOURCE_BUCKET" {
  value = "${aws_s3_bucket.media_source_bucket.id}-${var.APP_ENV}"
}

output "AWS_S3_MEDIA_DISPLAY_BUCKET" {
  value = "${aws_s3_bucket.media_display_bucket.id}-${var.APP_ENV}"
}
