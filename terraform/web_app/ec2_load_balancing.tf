# EC2

## Load Balancing

resource "aws_lb" "web_app" {
  # 'aws_elb` is the classic load balancer, do not use it.
  enable_http2 = true
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
    "${data.aws_subnet.web_app.*.id}"
  ]
}

resource "aws_lb_listener" "web_app" {
  load_balancer_arn = "${aws_lb.web_app.arn}"
  # port              = "443"
  # protocol          = "HTTPS"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web_app.arn}"
  }
}

resource "aws_lb_target_group" "web_App" {
  name     = "Web App"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_default_vpc.default.id}"
}
