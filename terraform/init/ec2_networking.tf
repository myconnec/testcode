resource "aws_security_group" "ssh" {
  description = "Allow ssh inbound traffic on port 22."
  name        = "ssh-${random_uuid.provider.result}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "${chomp(data.http.local_ip.body)}/32",
    ]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "EC2"
    tech    = "Networking"
    Name    = "ssh"
  }

  vpc_id = "${aws_default_vpc.default.id}"
}

resource "aws_security_group" "https" {
  description = "Allow https inbound traffic on port 443."
  name        = "https-${random_uuid.provider.result}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "EC2"
    tech    = "Networking"
    Name    = "https"
  }

  vpc_id = "${aws_default_vpc.default.id}"
}