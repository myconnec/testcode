# Load Balancer

resource "aws_lb" "web_app" {
  enable_deletion_protection = false
  internal = false
  load_balancer_type = "application"
  name = "${var.APP_NAME}-app-load-balancer-${var.APP_ENV}"
  enable_cross_zone_load_balancing   = "${var.APP_ENV != "prd" ? true : false}"
  enable_http2 = true
  idle_timeout = 300

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

resource "aws_lb_target_group" "alb_http_target_group" {
  name     = "${var.APP_NAME}-aLB-target-group-${var.APP_ENV}"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_default_vpc.default.id}"

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = 80
  }

  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
    enabled         = true
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Ruby on Rails"
  }
}

resource "aws_launch_configuration" "web_app" {
  associate_public_ip_address = "${var.APP_ENV != "prd" ? true : false}"
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  image_id = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.COMPUTE_SIZE}"
  key_name = "${var.AWS_PEM_KEY_PAIR}"

  security_groups = [
    "${aws_security_group.http.name}",
    "${aws_security_group.https.name}",
    "${aws_security_group.mysql.name}",
    "${aws_security_group.ssh.name}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "autoscale_group" {
  launch_configuration = "${aws_launch_configuration.web_app.id}"
  max_size = 1
  min_size = 1

  target_group_arns = [
    "${aws_lb_target_group.alb_http_target_group.name}"
  ]

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "networking"
    propagate_at_launch = true
  }
}

# Subnets

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

# VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
