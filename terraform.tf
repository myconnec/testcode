# RDS
# source https://medium.com/@vankhoa011/how-i-use-terraform-to-restore-the-latest-snapshot-from-productions-db-to-staging-s-db-aws-rds-6ad4f6620df2
# resource "aws_db_instance" "rds" {
#   allocated_storage    = 10
#   copy_tags_to_snapshot= true
#   storage_type         = "gp2"
#   engine               = "mariadb"
#   engine_version       = "10.3"
#   instance_class       = "db.t2.micro"
#   name                 = "connechub"
#   username             = "${var.DB_USER}"
#   password             = "${var.DB_PASS}"
#   parameter_group_name = "default.mariadb10.3"
#   skip_final_snapshot  = false # if prod false, else true

# ident = connechub

#   tags = {
#     app     = "ConnecHub"
#     env     = "${var.APP_ENV}"
#     owner   = "admin@connechub.com"
#     service = "RDS"
#     tech    = "MariaDB"
#   }
# }

# S3

# EC2
resource "aws_eip" "eip" {
  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EIP"
    tech    = "Networking"
  }
  vpc = true
}

resource "aws_instance" "web" {
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  instance_type = "t2.micro"
  ami = "ami-0c8b8e32659017cc5"
  key_name      = "${var.AWS_PEM_KEY_PAIR}"

  provisioner "local-exec" {
    command = "sleep 120; ANSIBLE_NOCOWS=1 ANSIBLE_DEBUG=0 ANSIBLE_HOST_KEY_CHECKING=0 ansible-playbook -i '${self.public_ip},' -u ubuntu --private-key ${var.AWS_PEM_KEY_PAIR} ./docs/ansible/ror.yml"
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Ruby on Rails"
  }
  security_groups = [
    "${aws_security_group.ec2_security_group_http.name}",
    "${aws_security_group.ec2_security_group_https.name}",
    "${aws_security_group.ec2_security_group_ssh.name}",
    "${aws_security_group.ec2_security_group_ror.name}",
  ]
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name  = "ec2_web_instance_profile"
  role = "${aws_iam_role.ec2_web_server_role.name}"
}

resource "aws_iam_role" "ec2_web_server_role" {
  assume_role_policy = "${file("./assumerolepolicy.json")}"
  name               = "CHServiceRoleForEC2WithCodeCommitReadOnlyPermission"
}

# S3 read only
resource "aws_iam_role_policy_attachment" "s3_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role      = "${aws_iam_role.ec2_web_server_role.name}"
}

# Code Commit read only
resource "aws_iam_role_policy_attachment" "code_commit_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitReadOnly"
  role      = "${aws_iam_role.ec2_web_server_role.name}"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.web.id}"
  allocation_id = "${aws_eip.eip.id}"
}

resource "aws_security_group" "ec2_security_group_http" {
  name = "http"

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_security_group" "ec2_security_group_ror" {
  name        = "ror"
  description = "Allow RoR inbound traffic"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Networking"
  }
}

# ECS

# Transcoder

# Route53
# resource "aws_route53_record" "test_domain" {
#   zone_id = "Z343LWN1DJ92M1"
#   name    = "test"
#   type    = "A"
#   ttl     = "15"
#   records = ["${aws_eip.eip.public_ip}"]
# }
