# EC2

## EIP
resource "aws_eip" "web_app" {
  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EIP"
    tech    = "Networking"
  }

  vpc = true
}

## EIP Association

resource "aws_eip_association" "web_app" {
  instance_id   = "${aws_instance.web_app.id}"
  allocation_id = "${aws_eip.web_app.id}"
}

## Security Group

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
    app     = "connechub"
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
    app     = "connechub"
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
  name = "ssh"
  description = "Allow ssh inbound traffic"

   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "${chomp(data.http.local_ip.body)}/32",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  tags = {
    app     = "connechub"
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
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "RDS"
    tech    = "Networking"
    Name    = "mysql"
  }

  vpc_id = "${aws_default_vpc.default.id}"
}
