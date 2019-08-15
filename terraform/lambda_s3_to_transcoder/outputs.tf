output "lambda_s3_to_transcoder_lambda_function_name" {
  value = "${aws_lambda_function.aws_lambda_function.function_name}"
}
