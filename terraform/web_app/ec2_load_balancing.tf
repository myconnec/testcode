# EC2

## Load Balancing

resource "aws_lb" "web_app" {
  # 'aws_elb` is the classic load balancer, do not use it.
  enable_http2 = true
  internal           = false
  load_balancer_type = "application"
  name               = "${var.APP_NAME}-load-balancer-${var.APP_ENV}"

  access_logs {
    bucket  = "${var.APP_NAME}-log-${var.APP_ENV}"
    prefix  = "log"
    enabled = true
  }
  
  security_groups = [
    "${aws_security_group.http.id}",
    "${aws_security_group.https.id}",
  ]

  subnets = [
    "${aws_default_subnet.default_az1.id}"
  ]

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "ec2"
    tech    = "load balancer"
  }
}
