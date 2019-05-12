# IAM Policy Attachments

# CodeCommit

resource "aws_iam_role_policy_attachment" "code_commit_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitReadOnly"
  role       = "${aws_iam_role.ec2_web_server_role.name}"
}

# S3

resource "aws_iam_role_policy_attachment" "s3_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = "${aws_iam_role.ec2_web_server_role.name}"
}

# IAM Roles

resource "aws_iam_role" "ec2_web_server_role" {
  assume_role_policy = "${file("./terraform/web_app/policies/assumerolepolicy.json")}"
  name               = "CHServiceRoleForEC2WithCodeCommitReadOnlyPermission"
}

resource "aws_iam_user_policy" "s3_bucket_access_policy" {
  name = "${var.APP_NAME}_s3_bucket_access_policy_${var.APP_ENV}"
  user = "${aws_iam_user.s3_bucket_access_user.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::${var.media_display_bucket_id}",
                "arn:aws:s3:::${var.media_display_bucket_id}/*",
                "arn:aws:s3:::${var.media_source_bucket_id}",
                "arn:aws:s3:::${var.media_source_bucket_id}*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_user" "s3_bucket_access_user" {
  name = "${var.APP_NAME}_s3_bucket_access_user_${var.APP_ENV}"
  path = "/"
}

resource "aws_iam_access_key" "s3_bucket_access_key" {
  user = "${aws_iam_user.s3_bucket_access_user.name}"
}