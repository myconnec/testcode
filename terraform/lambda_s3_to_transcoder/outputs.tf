output "lambda_s3_to_transcoder_lambda_function_name" {
  value = "${aws_lambda_function.s3_to_transcoder.function_name}"
}
