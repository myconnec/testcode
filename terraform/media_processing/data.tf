# AWS IAM Policy
data "aws_iam_policy" "transcoder_full_access_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonElasticTranscoder_FullAccess"
}

data "aws_iam_policy" "s3_full_access_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

