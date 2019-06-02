
# Route53

resource "aws_route53_record" "subdomain" {
  zone_id = "Z343LWN1DJ92M1"
  name    = "${var.APP_ENV != "prd" ? var.APP_ENV : "www"}"
  type    = "A"
  ttl     = "15"
  records = ["${aws_lb.web_app.dns_name}"]
}
