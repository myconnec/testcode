# TODO: S3 -> Lambda - > Transcoder event chain
# Source: https://read.acloud.guru/easy-video-transcoding-in-aws-7a0abaaab7b8
# Source: https://www.justdocloud.com/2018/10/02/event-notification-s3-bucket/

# data

# resource

## S3 trigger

## lambda

## transcoder

# output

# example

data "aws_iam_policy_document" "iam_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = "LAMBDA-ROLE"
  assume_role_policy = "${data.aws_iam_policy_document.iam_assume_role_policy.json}"
}

resource "aws_lambda_function" "s3lambda" {
  filename      = "./lambda_source/s3_to_transcoder.js"
  function_name = "s3_lambda_transcoder"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python2.7"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.s3lambda.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${var.SOURCE_BUCKET}"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.SOURCE_BUCKET}"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${aws_s3_bucket.bucket.id}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.s3lambda.arn}"
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "<_prefix_if_any_dir_in_s3>/"
    filter_suffix       = "<_suffix_of_file_put_in_s3>"
  }
}
