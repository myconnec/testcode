# VPC

## Default VPC
resource "aws_default_vpc" "default" {

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "network"
    Name = "Default VPC"
  }
}
