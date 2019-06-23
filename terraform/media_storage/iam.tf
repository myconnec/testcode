# IAM

# IAM Policy
resource "aws_iam_policy" "bucket_access" {
  name        = "ConnecHubS3BucketAccess"
  description = "Access to the display and source buckets for a given ENV."
  policy      = "${data.template_file.bucket_access_policy.template}"
}

## User Policy Attachment
resource "aws_iam_user_policy_attachment" "bucket_access" {
  user       = "s3_bucket_access_${var.APP_ENV}"
  policy_arn = "${aws_iam_policy.bucket_access.arn}"
}
