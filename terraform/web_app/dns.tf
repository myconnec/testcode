# Route53

resource "aws_route53_record" "subdomain" {
  zone_id = "Z343LWN1DJ92M1"
  name    = "${var.APP_ENV == "prd" ? "www" : var.APP_ENV}"
  type    = "A"

  alias {
    name                   = "${aws_lb.web_app.dns_name}"
    zone_id                = "${aws_lb.web_app.zone_id}"
    evaluate_target_health = "${var.APP_ENV == "prd" ? true : false}"
  }
}
