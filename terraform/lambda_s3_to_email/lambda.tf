resource "aws_lambda_function" "media_processing_complete_email" {
  environment {
    variables = {
      # SMTP creds and defaults
      SES_SMTP_FROM = "${var.SES_SMTP_FROM}"
      SES_SMTP_HOST = "${var.SES_SMTP_HOST}"
      SES_SMTP_PASS = "${var.SES_SMTP_PASS}"
      SES_SMTP_PORT = "${var.SES_SMTP_PORT}"
      SES_SMTP_USER = "${var.SES_SMTP_USER}"

      # SQL creds
      SQL_HOST = "${var.SQL_HOST}"
      SQL_PASS = "${var.SQL_PASS}"
      SQL_SCHE = "${var.SQL_SCHE}"
      SQL_USER = "${var.SQL_USER}"

      # APP data
      STAGE = "${var.STAGE}"
      APP_ENV  = "${var.APP_ENV}"
    }
  }

  filename         = "${data.archive_file.lambda_zip.output_path}"
  function_name    = "${var.STAGE}_media_processing_complete_email_${var.APP_ENV}"
  handler          = "index.lambda_handler"
  role             = "${aws_iam_role.lambda_role.arn}"
  runtime          = "python3.7"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.media_processing_complete_email.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${var.media_display_bucket_arn}"
}
