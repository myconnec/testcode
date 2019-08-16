# Source: https://read.acloud.guru/easy-video-transcoding-in-aws-7a0abaaab7b8
# Source: https://www.justdocloud.com/2018/10/02/event-notification-s3-bucket/
# Source: https://docs.aws.amazon.com/elastictranscoder/latest/developerguide/access-control.html

resource "aws_lambda_function" "s3_to_transcoder" {
  environment {
    variables = {
      region                 = "${var.AWS_REGION}"
      transcoder_pipeline_id = "${var.transcoder_pipeline_id}"
      media_source_bucket_id = "${var.media_source_bucket_id}"
    }
  }

  filename         = "${data.archive_file.lambda_zip.output_path}" #./terraform/lambda_s3_to_transcoder/index.js.zip"
  function_name    = "${var.APP_NAME}_s3_to_transcoder_${var.APP_ENV}"
  handler          = "index.handler"
  role             = "${aws_iam_role.lambda_role.arn}"
  runtime          = "nodejs8.10"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.s3_to_transcoder.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${var.video_process_media_source_bucket_arn}"
}