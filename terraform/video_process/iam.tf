# IAM

## Attachemnt

resource "aws_iam_role_policy_attachment" "transcoder_role_policy_attachment" {
  role       = "${aws_iam_role.transcoder_role.name}"
  policy_arn = "${data.aws_iam_policy.transcoder_full_access_policy.arn}"
}

resource "aws_iam_role_policy_attachment" "transcoder_role_policy_attachment_2" {
  role       = "${aws_iam_role.transcoder_role.name}"
  policy_arn = "${data.aws_iam_policy.s3_full_access_policy.arn}"
}

# Role

resource "aws_iam_role" "transcoder_role" {
  name        = "CHTranscoder"
  description = "Allow AWS ElasticTranscoder access S3, transcoder a video, and save to the target S3 bucket."

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "elastictranscoder.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}
