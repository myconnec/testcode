output "media_display_bucket_id" {
  value = "${aws_s3_bucket.media_display.id}"
}

output "media_source_bucket_id" {
  value = "${aws_s3_bucket.media_source.id}"
}

output "media_source_bucket_arn" {
  value = "${aws_s3_bucket.media_source.arn}"
}
