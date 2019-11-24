resource "aws_s3_bucket_notification" "display_bucket_notification" {
  bucket = "${var.media_display_bucket_id}"

  # TODO figure out how to make this work
  # depends_on = [
  #   "${var.media_display_bucket_id.id}"
  # ]

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.lambda_s3_to_rds_for_promo_1.arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}
