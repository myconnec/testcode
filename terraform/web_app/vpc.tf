# VPC

## Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    app     = "${var.APP_NAME}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "EC2"
    tech    = "network"
    Name    = "Default VPC"
  }
}
