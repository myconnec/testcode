resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${var.video_process_media_display_bucket_arn}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.media_processing_complete_email.arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}
