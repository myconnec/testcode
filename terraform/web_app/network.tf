# EIP
resource "aws_eip" "web_app" {
  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EIP"
    tech    = "Networking"
  }

  vpc = true
}

# EIP Association

resource "aws_eip_association" "web_app" {
  instance_id   = "${aws_instance.web_app.id}"
  allocation_id = "${aws_eip.web_app.id}"
}

# Load Balancer

# Create a new load balancer
resource "aws_lb" "web_app" {
  enable_deletion_protection = false
  internal = false
  load_balancer_type = "application"
  name = "${var.APP_NAME}-app-load-balancer-${var.APP_ENV}"

  access_logs {
    bucket  = "log-${var.APP_ENV}"
    prefix  = "log"
    enabled = true
  }

  security_groups = [
    "${aws_security_group.http.id}",
    "${aws_security_group.https.id}",
  ]

  subnets = [
    "${aws_default_subnet.default_az1.id}",
    "${aws_default_subnet.default_az2.id}",
  ]

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "networking"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-west-1b"

  tags = {
    Name = "Default subnet for us-west-1b"
  }
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = "us-west-1c"

  tags = {
    Name = "Default subnet for us-west-1c"
  }
}

# Security Group

resource "aws_default_security_group" "default" {
  vpc_id = "${aws_default_vpc.default.id}"
}

resource "aws_security_group" "http" {
  description = "Allow http inbound traffic on port 80."
  name        = "http"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Networking"
    Name    = "http"
  }

  vpc_id = "${aws_default_vpc.default.id}"
}

resource "aws_security_group" "https" {
  description = "Allow https inbound traffic on port 442."
  name        = "https"
  description = "Allow https inbound traffic"

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
    Name    = "https"
  }

  vpc_id = "${aws_default_vpc.default.id}"
}

resource "aws_security_group" "ssh" {
  description = "Allow ssh inbound traffic on port 22."
  name        = "ssh"
  description = "Allow ssh inbound traffic"

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
    Name    = "ssh"
  }

  vpc_id = "${aws_default_vpc.default.id}"
}

resource "aws_security_group" "mysql" {
  description = "Allow mysql/mariadb inbound traffic on port 3306."
  name        = "mysql"
  description = "Allow mysql/mariadb inbound traffic"

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
    Name    = "mysql"
  }

  vpc_id = "${aws_default_vpc.default.id}"
}

# Route53

resource "aws_route53_record" "subdomain" {
  zone_id = "Z343LWN1DJ92M1"
  name    = "${var.APP_ENV != "prd" ? var.APP_ENV : "www"}"
  type    = "A"
  ttl     = "15"
  records = ["${aws_eip.web_app.public_ip}"]
}

# VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
