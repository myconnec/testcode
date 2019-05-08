resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${var.media_source_bucket_id}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.s3lambda.arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}
