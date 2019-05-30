# Route53

resource "aws_route53_record" "subdomain" {
  zone_id = "Z343LWN1DJ92M1"
  name    = "${var.APP_ENV != "prd" ? var.APP_ENV : "www"}"
  type    = "A"
  ttl     = "15"
  records = ["${aws_eip.web_app.public_ip}"]
}

# VPC (default)
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

# Subnets (default)
resource "aws_default_subnet" "default_az1" {
  availability_zone = "${var.AWS_REGION}"

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "network"
    Name = "Default subnet for ${var.AWS_REGION}."
  }
}
