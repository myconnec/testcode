resource "aws_lambda_function" "lambda_s3_to_rds_for_promo_1" {
  environment {
    variables = {
      # SQL creds
      SQL_HOST = "${var.SQL_HOST}"
      SQL_PASS = "${var.SQL_PASS}"
      SQL_SCHE = "${var.SQL_SCHE}"
      SQL_USER = "${var.SQL_USER}"

      # APP data
      APP_NAME = "${var.APP_NAME}"
      APP_ENV  = "${var.APP_ENV}"
    }
  }

  filename         = "${data.archive_file.lambda_zip.output_path}"
  function_name    = "${var.APP_NAME}_lambda_s3_to_rds_for_promo_1_${var.APP_ENV}"
  handler          = "index.lambda_handler"
  role             = "${aws_iam_role.lambda_role.arn}"
  runtime          = "python3.7"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda_s3_to_rds_for_promo_1.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${var.media_display_bucket_arn}"
}
