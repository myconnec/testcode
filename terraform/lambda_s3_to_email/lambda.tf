resource "aws_lambda_function" "media_processing_complete_email" {
  environment {
    variables = {
      # SMTP creds and defaults
      SMTP_FROM = "${var.SMTP_FROM}"
      SMTP_HOST = "${var.SMTP_HOST}"
      SMTP_PASS = "${var.SMTP_PASS}"
      SMTP_PORT = "${var.SMTP_PORT}"
      SMTP_USER = "${var.SMTP_USER}"

      # SQL creds
      SQL_HOST = "${var.SQL_HOST}"
      SQL_PASS = "${var.SQL_PASS}"
      SQL_SCHE = "${var.SQL_SCHE}"
      SQL_USER = "${var.SQL_USER}"
    }
  }

  function_name    = "${var.APP_NAME}_media_processing_complete_email_${var.APP_ENV}"
  handler          = "index"
  role             = "${aws_iam_role.lambda_role.arn}"
  runtime          = "python3.7"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.media_processing_complete_email.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${var.video_process_media_display_bucket_arn}"
}