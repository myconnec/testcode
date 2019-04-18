# EC2
resource "aws_instance" "web" {
  instance_type        = "t2.micro"
  # us-east-1 ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320 ami-0c8b8e32659017cc5
  # us-west-1 ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320 ami-0f1d0daf2937d0064
  ami                  = "ami-0f1d0daf2937d0064"
  # iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  key_name             = "${var.AWS_PEM_KEY_PAIR}"

  # provisioner "local-exec" {
  #  # ./terraform/s3_mount/s3_mount.sh tst media-source media-display
  #   command = "./terraform/s3_mount/s3_mount.sh ${var.APP_ENV} ${var.AWS_S3_MEDIA_SOURCE_BUCKET} ${var.AWS_S3_MEDIA_DISPLAY_BUCKET}"
  # }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Ruby on Rails"
  }

  vpc_security_group_ids = [
    "${aws_security_group.ec2_security_group_https.name}",
    "${aws_security_group.ec2_security_group_ssh.name}"
  ]
}

# resource "aws_iam_instance_profile" "ec2_profile" {
#   name = "ec2_web_instance_profile"
#   role = "${aws_iam_role.ec2_web_server_role.name}"
# }

# resource "aws_iam_role" "ec2_web_server_role" {
#   assume_role_policy = "${file("./terraform/web_app/policies/assumerolepolicy.json")}"
#   name               = "CHServiceRoleForEC2WithS3FullAccessPermission"
# }


# resource "aws_iam_role_policy_attachment" "s3_read_only" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
#   role       = "${aws_iam_role.ec2_web_server_role.name}"
# }

# Security Groups

resource "aws_security_group" "ec2_security_group_https" {
  name = "https"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Networking"
  }
}

resource "aws_security_group" "ec2_security_group_ssh" {
  name        = "ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Networking"
  }
}

# S3 Buckets

resource "aws_s3_bucket" "media_source_bucket" {
  # acl = "private"

  bucket = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}-${var.APP_ENV}"

  force_destroy = "${var.APP_ENV != "prd" ? true : false}"
  region        = "${var.AWS_REGION}"

  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }
  #   }
  # }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "S3"
    tech    = "Storage"
  }
}

# resource "aws_s3_bucket" "media_disply_bucket" {
#   acl = "private"

#   bucket = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}-${var.APP_ENV}"

#   force_destroy = "${var.APP_ENV != "prd" ? true : false}"
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
#   }
# }

