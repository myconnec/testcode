# EC2

## Load Balancing

resource "aws_lb" "web_app" {
  # 'aws_elb` is the classic load balancer, do not use it.
  enable_http2       = true
  internal           = false
  load_balancer_type = "application"
  name               = "${var.APP_NAME}-load-balancer-${var.APP_ENV}"

  # TODO: Create a logging AWs acct to act as a central logging location.
  # access_logs {
  #   bucket  = "${var.APP_NAME}-log-${var.APP_ENV}"
  #   prefix  = "log"
  #   enabled = true
  # }

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "ec2"
    tech    = "load balancer"
  }
  security_groups = [
    "${aws_security_group.http.id}",
    "${aws_security_group.https.id}",
  ]
  subnets = [
    # "${data.aws_subnet.web_app.*.id}"
    "subnet-065d251a97a108fdf",

    "subnet-07a42d4736771e4b7",
  ]

  # "${data.aws_subnet_ids.web_app.ids[0]}",
  # "${data.aws_subnet_ids.web_app.ids[1]}"
}

resource "aws_lb_target_group" "web_app" {
  name     = "webapplbtargetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_default_vpc.default.id}"

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    "aws_lb.web_app",
  ]
}

resource "aws_lb_listener" "web_app_http" {
  load_balancer_arn = "${aws_lb.web_app.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web_app.arn}"
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    "aws_lb_target_group.web_app",
  ]
}

resource "aws_lb_listener" "web_app_https" {
  certificate_arn   = "${var.securit_tls_arn}"
  load_balancer_arn = "${aws_lb.web_app.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web_app.arn}"
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    "aws_lb_target_group.web_app",
  ]
}

resource "aws_lb_target_group_attachment" "web_app" {
  target_group_arn = "${aws_lb_target_group.web_app.arn}"
  target_id        = "${aws_instance.web_app.id}"
  port             = 80

  depends_on = [
    "aws_lb_listener.web_app_https",
  ]
}
