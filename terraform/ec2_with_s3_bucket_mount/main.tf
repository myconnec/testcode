# # Instance Profile
# resource "aws_iam_instance_profile" "ec2_profile" {
#   name = "ec2_web_instance_profile"
#   role = "${aws_iam_role.ec2_web_server_role.name}"
# }

# # EC2 instance
# resource "aws_instance" "web_instance" {
#   iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
#   instance_type        = "t2.micro"
#   ami                  = "ami-0c8b8e32659017cc5"
#   key_name             = "${var.AWS_PEM_KEY_PAIR}"

#   provisioner "local-exec" {
#     command = "./terraform/ec2_with_s3_bucket_mount/poc.sh"
#   }

#   tags = {
#     app     = "ConnecHub"
#     env     = "${var.APP_ENV}"
#     owner   = "admin@connechub.com"
#     service = "EC2"
#     tech    = "Ruby on Rails"
#     phase   = "poc"
#   }

#   # vpc_security_group_ids = [
#   #   "${aws_security_group.ssh.name}",
#   # ]
# }

# # Role
# resource "aws_iam_role" "ec2_web_server_role" {
#   assume_role_policy = "${file("./terraform/ec2_with_s3_bucket_mount/policies/assumerolepolicy.json")}"
#   name               = "CHServiceRoleForEC2WithS3FullAccess"
# }

# # Role Policy Attachment
# ## S3 Read Only
# resource "aws_iam_role_policy_attachment" "s3_read_only" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
#   role       = "${aws_iam_role.ec2_web_server_role.name}"
# }

# # Security Groups

# resource "aws_security_group" "ssh" {
#   name        = "ssh"
#   description = "Allow SSH inbound traffic"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     self        = true
#   }

#   tags = {
#     app     = "ConnecHub"
#     env     = "${var.APP_ENV}"
#     owner   = "admin@connechub.com"
#     service = "EC2"
#     tech    = "Networking"
#   }
# }

# # Policies

# # S3 bucket
# resource "random_uuid" "s3_bucket_randomizer" {}

# resource "aws_s3_bucket" "poc_media" {
#   acl           = "private"
#   bucket        = "poc-media-${var.APP_ENV}-${random_uuid.s3_bucket_randomizer.result}"
#   force_destroy = false
#   region        = "${var.AWS_REGION}"

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   tags = {
#     app     = "ConnecHub"
#     env     = "${var.APP_ENV}"
#     owner   = "admin@connechub.com"
#     service = "S3"
#     tech    = "Storage"
#     phase   = "poc"
#   }
# }



resource "aws_iam_user" "ec2_to_s3" {
  name = "ec2_to_s3"
  path = "/"
}

resource "aws_iam_access_key" "ec2_to_s3" {
  user    = "${aws_iam_user.ec2_to_s3.name}"
}

resource "aws_iam_user_policy" "ec2_to_s3" {
  name = "CHEC2USerPolicy"
  user = "${aws_iam_user.ec2_to_s3.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
