# EC2

## Security Group

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group" "http" {
  description = "Allow http inbound traffic on port 80."
  name        = "http-${random_uuid.provider.result}"

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

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "EC2"
    tech    = "Networking"
    Name    = "http"
  }

  vpc_id = aws_default_vpc.default.id
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
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "EC2"
    tech    = "Networking"
    Name    = "https"
  }

  vpc_id = aws_default_vpc.default.id
}

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
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "EC2"
    tech    = "Networking"
    Name    = "ssh"
  }

  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group" "mysql" {
  description = "Allow mysql/mariadb inbound traffic on port 3306."
  name        = "mysql-${random_uuid.provider.result}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "EC2"
    tech    = "Networking"
    Name    = "mysql"
  }

  vpc_id = aws_default_vpc.default.id
}

resource "aws_security_group" "puma" {
  description = "Allow Ruby Puma  inbound traffic on port 9293."
  name        = "puma-${random_uuid.provider.result}"

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    self      = true
  }

  ingress {
    from_port = 9293
    to_port   = 9293
    protocol  = "tcp"

    security_groups = [
      aws_security_group.https.id,
    ]
  }

  ingress {
    from_port = 9293
    to_port   = 9293
    protocol  = "tcp"
    self      = true
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "EC2"
    tech    = "Networking"
    Name    = "puma"
  }

  vpc_id = aws_default_vpc.default.id
}

