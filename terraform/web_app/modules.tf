module "alb" {
  source    = "git::https://github.com/cloudposse/terraform-aws-alb.git?ref=tags/0.3.0"
  namespace = "${var.APP_NAME}"
  name      = "app"
  stage     = "${var.APP_ENV}"

  https_port = "443"

  vpc_id          = "vpc-23a98144"
  ip_address_type = "ipv4"

  subnet_ids = [
    "subnet-249d8643",
    "subnet-61eadd3a",
  ]

  access_logs_region = "us-west-1"
}
