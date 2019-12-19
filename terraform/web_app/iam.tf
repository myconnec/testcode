# IAM Policy Attachments

# CodeCommit

resource "aws_iam_role_policy_attachment" "code_commit_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitReadOnly"
  role       = aws_iam_role.ec2_web_server_role.name
}

# S3

resource "aws_iam_role_policy_attachment" "s3_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.ec2_web_server_role.name
}

# IAM Roles

resource "aws_iam_role" "ec2_web_server_role" {
  assume_role_policy = file("./terraform/web_app/policies/ec2_web_app_role_policy.json")
  name               = "${var.APP_NAME}-${var.APP_ENV}-EC2WebAppRolePolicy"
}

