# RDS

resource "aws_db_instance" "rds" {
  allocated_storage     = 10
  copy_tags_to_snapshot = true
  storage_type          = "gp2"
  engine                = "mariadb"
  engine_version        = "10.3"
  instance_class        = "db.t2.micro"
  name                  = "connechub"
  identifier            = "connechub-${var.APP_ENV}"
  username              = "${var.DB_USER}"
  password              = "${var.DB_PASS}"
  parameter_group_name  = "default.mariadb10.3"
  skip_final_snapshot   = true

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "RDS"
    tech    = "MariaDB"
  }
  vpc_security_group_ids = [
    "${aws_security_group.rds_security_group_mysql.id}",
  ]
}

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
  instance_type        = "t2.micro"
  ami                  = "ami-0c8b8e32659017cc5"
  key_name             = "${var.AWS_PEM_KEY_PAIR}"

  provisioner "local-exec" {
    command = "./terraform/web_app/ansible.sh"
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Ruby on Rails"
  }

  vpc_security_group_ids = [
    "${aws_security_group.ec2_security_group_http.name}",
    "${aws_security_group.ec2_security_group_https.name}",
    "${aws_security_group.rds_security_group_mysql.name}",
    "${aws_security_group.ec2_security_group_ssh.name}",
  ]
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_web_instance_profile"
  role = "${aws_iam_role.ec2_web_server_role.name}"
}

resource "aws_iam_role" "ec2_web_server_role" {
  assume_role_policy = "${file("./terraform/web_app/policies/assumerolepolicy.json")}"
  name               = "CHServiceRoleForEC2WithCodeCommitReadOnlyPermission"
}

# S3 read only

resource "aws_iam_role_policy_attachment" "s3_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role       = "${aws_iam_role.ec2_web_server_role.name}"
}

# Code Commit read only

resource "aws_iam_role_policy_attachment" "code_commit_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitReadOnly"
  role       = "${aws_iam_role.ec2_web_server_role.name}"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.web.id}"
  allocation_id = "${aws_eip.eip.id}"
}

# Security Groups

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

resource "aws_security_group" "rds_security_group_mysql" {
  name        = "mysql"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    self      = true
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "RDS"
    tech    = "Networking"
  }
}

# Route53

resource "aws_route53_record" "test_domain" {
  zone_id = "Z343LWN1DJ92M1"
  name    = "test"
  type    = "A"
  ttl     = "15"
  records = ["${aws_eip.eip.public_ip}"]
}
