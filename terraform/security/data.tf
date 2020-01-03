data "aws_route53_zone" "zone" {
  name         = "connechub.com."
  private_zone = false
}
