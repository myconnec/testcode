module "alb" {
  access_logs_region = "${var.AWS_REGION}"
  ip_address_type = "ipv4"
  namespace = "${var.APP_NAME}"
  name      = "app"
  source    = "git::https://github.com/cloudposse/terraform-aws-alb.git?ref=tags/0.3.0"
  stage     = "${var.APP_ENV}"
  #vpc_id    = "vpc-23a98144"
  vpc_id    = "aws_default_vpc.default.id"

  subnet_ids = [
    "subnet-249d8643",
    "subnet-61eadd3a",
  ]

  tags = {
    app     = "${var.APP_NAME}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "vpc"
    tech    = "network"
  }
}
