# EC2

## Load Balancer

resource "aws_lb" "web_app" {
  enable_http2       = true
  internal           = false
  load_balancer_type = "application"
  name               = "${var.STAGE}-load-balancer-${var.APP_ENV}"

  # access_logs {
  #   bucket  = "${aws_s3_bucket.web_app_log.bucket}"
  #   enabled = true
  # }

  tags = {
    app     = "${var.STAGE}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "load balancer"
    tech    = "network"
  }
  security_groups = [
    "${aws_security_group.http.id}",
    "${aws_security_group.https.id}",
  ]
  subnets = [
    "${data.aws_subnet_ids.web_app.ids}",
  ]
}

## Load Balancer - Target Group

resource "aws_lb_target_group" "web_app" {
  name     = "${var.APP_ENV}-web-app-alb-target-group"
  port     = 9293
  protocol = "HTTP"
  vpc_id   = "${aws_default_vpc.default.id}"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    app     = "${var.STAGE}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "load balancer - target group"
    tech    = "network"
  }

  depends_on = [
    "aws_lb.web_app",
  ]
}

## Load Balancer - Listener

resource "aws_lb_listener" "web_app_http" {
  load_balancer_arn = "${aws_lb.web_app.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    "aws_lb_target_group.web_app",
  ]
}

resource "aws_lb_listener" "web_app_https" {
  certificate_arn   = "${var.security_tls_arn}"
  load_balancer_arn = "${aws_lb.web_app.arn}"
  port              = 443
  protocol          = "HTTPS"

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

## Load Balancer - Group Attachment
resource "aws_lb_target_group_attachment" "web_app" {
  target_group_arn = "${aws_lb_target_group.web_app.arn}"
  target_id        = "${aws_instance.web_app.id}"
  port             = 9293

  depends_on = [
    "aws_lb_listener.web_app_http",
    "aws_lb_listener.web_app_https",
  ]
}
