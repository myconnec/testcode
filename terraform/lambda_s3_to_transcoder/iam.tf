#iam

## Attachment

# logging

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}

## Policy

resource "aws_iam_policy" "lambda_logging" {
  name        = "${var.APP_NAME}_lambda_s3_transcoder_logging_${var.APP_ENV}"
  path        = "/"
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

## Role

resource "aws_iam_role" "lambda_role" {
  name               = "${var.APP_NAME}-3EventTriggerFormTranscoder-${var.APP_ENV}"
  assume_role_policy = "${data.aws_iam_policy_document.iam_assume_role_policy.json}"
}
