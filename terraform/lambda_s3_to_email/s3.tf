resource "aws_s3_bucket_notification" "display_bucket_notification" {
  bucket = "${var.media_display_bucket_id}"

  depends_on = [
    "${var.media_display_bucket_id.id}"
  ]

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.media_processing_complete_email.arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}
