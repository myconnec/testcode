# TODO: S3 -> Lambda - > Transcoder event chain
# Source: https://read.acloud.guru/easy-video-transcoding-in-aws-7a0abaaab7b8
# Source: https://www.justdocloud.com/2018/10/02/event-notification-s3-bucket/
# Source: https://docs.aws.amazon.com/elastictranscoder/latest/developerguide/access-control.html

resource "aws_lambda_function" "s3lambda" {
  filename      = "./terraform/lambda_s3_to_transcoder/lambda_source/index.js.zip"
  function_name = "s3lambda"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "index.handler"
  runtime       = "nodejs8.10"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.s3lambda.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${var.video_process_media_source_bucket_arn}"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.s3lambda.arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}
