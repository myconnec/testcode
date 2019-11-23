output "lambda_s3_to_email_function_name" {
  value = "${aws_lambda_function.media_processing_complete_email.function_name}"
}
