# TODO: S3 -> Lambda - > Transcoder event chain
# Source: https://read.acloud.guru/easy-video-transcoding-in-aws-7a0abaaab7b8
# Source: https://www.justdocloud.com/2018/10/02/event-notification-s3-bucket/

# data
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

# resource

## S3 trigger

## lambda

## transcoder

# output

# example
resource "aws_iam_role" "lambda_role" {
  name               = "CHS3EventTriggerFormTranscoder"
  assume_role_policy = "${data.aws_iam_policy_document.iam_assume_role_policy.json}"
}

resource "aws_lambda_function" "s3lambda" {
  filename      = "./terraform/video_processing/auto_trigger/lambda_source/handler.zip"
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
  source_arn    = "${var.SOURCE_BUCKET_ARN}"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${var.SOURCE_BUCKET_NAME}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.s3lambda.arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}

# logging
resource "aws_iam_policy" "lambda_logging" {
  name = "lambda_logging"
  path = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
        "Effect": "Allow",
        "Action": [
            "elastictranscoder:Read*",
            "elastictranscoder:List*",
            "elastictranscoder:*Job",
            "elastictranscoder:*Preset",
            "s3:List*",
            "sns:List*"
        ],
        "Resource": "*"
    },
    {
        "Sid": "Stmt1465486106000",
        "Effect": "Allow",
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:GetLogEvents",
            "logs:PutLogEvents",
            "logs:DescribeLogStreams"
        ],
        "Resource": [
            "arn:aws:logs:*:*:*"
        ]
    },
    {
        "Sid": "1",
        "Effect": "Allow",
        "Action": [
            "s3:Put*",
            "s3:ListBucket",
            "s3:*MultipartUpload*",
            "s3:Get*"
        ],
        "Resource": "*"
    },
    {
        "Sid": "2",
        "Effect": "Allow",
        "Action": "sns:Publish",
        "Resource": "*"
    },
    {
        "Sid": "3",
        "Effect": "Deny",
        "Action": [
            "s3:*Delete*",
            "s3:*Policy*",
            "sns:*Remove*",
            "sns:*Delete*",
            "sns:*Permission*"
        ],
        "Resource": "*"
    }
]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}