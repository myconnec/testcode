# RDS
resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mariadb"
  engine_version       = "10.3"
  instance_class       = "db.t2.micro"
  name                 = "connechub"
  username             = "${var.DB_USER}"
  password             = "${var.DB_PASS}"
  parameter_group_name = "default.mariadb10.3"
  skip_final_snapshot = false

  tags = {
    App     = "ConnecHub"
    ENV     = "PROD"
    Owner   = "admin@connechub.com"
    Service = "RDS"
    Tech    = "MariaDB"
  }
}

# S3

# EC2
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_eip" "eip" {
  vpc = true

  tags = {
    App     = "ConnecHub"
    ENV     = "PROD"
    Owner   = "admin@connechub.com"
    Service = "EIP"
    Tech    = "Networking"
  }
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name      = "${var.AWS_PEM_KEY_PAIR}"

  # provisioner "local-exec" {
  #   command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ${var.AWS_PEM_KEY_PAIR} -i '${aws_eip.eip.id},' ./docs/ansible/ror.yml"
  # }

  tags = {
    App     = "ConnecHub"
    ENV     = "PROD"
    Owner   = "admin@connechub.com"
    Service = "EC2"
    Tech    = "Ruby on Rails"
  }

  security_groups = [
    "${aws_security_group.ec2_security_group_http.name}",
    "${aws_security_group.ec2_security_group_https.name}",
    "${aws_security_group.ec2_security_group_ssh.name}",
    "${aws_security_group.ec2_security_group_ror.name}"
  ]
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
    App     = "ConnecHub"
    ENV     = "PROD"
    Owner   = "admin@connechub.com"
    Service = "EC2"
    Tech    = "Networking"
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
    App     = "ConnecHub"
    ENV     = "PROD"
    Owner   = "admin@connechub.com"
    Service = "EC2"
    Tech    = "Networking"
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

  tags = {
    App     = "ConnecHub"
    ENV     = "PROD"
    Owner   = "admin@connechub.com"
    Service = "EC2"
    Tech    = "Networking"
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
    App     = "ConnecHub"
    ENV     = "PROD"
    Owner   = "admin@connechub.com"
    Service = "EC2"
    Tech    = "Networking"
  }
}

# ECS

# Transcoder

# Route53
resource "aws_route53_record" "test_domain" {
  zone_id = "Z343LWN1DJ92M1"
  name    = "test"
  type    = "A"
  ttl     = "15"
  records = ["${aws_eip.eip.public_ip}"]
}
