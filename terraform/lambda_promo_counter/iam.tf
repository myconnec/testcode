#iam

## Attachment

# logging

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}

resource "aws_iam_role_policy_attachment" "rds_access" {
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${data.aws_iam_policy.rds_access.arn}"
}

resource "aws_iam_role_policy_attachment" "basic_exec" {
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${data.aws_iam_policy.basic_exec.arn}"
}

## Policy

resource "aws_iam_policy" "lambda_logging" {
  name        = "${var.APP_NAME}_lambda_promo_counter_logging_${var.APP_ENV}"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
        "Effect": "Allow",
        "Action": [
            "s3:List*"
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
    }
]
}
EOF
}

## Role

resource "aws_iam_role" "lambda_role" {
  name               = "${var.APP_NAME}-Lambda-PromoCounter-${var.APP_ENV}"
  assume_role_policy = "${data.aws_iam_policy_document.iam_assume_role_policy.json}"
}
