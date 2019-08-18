resource "aws_acm_certificate" "cert" {
  domain_name       = "${var.APP_ENV}.${var.APP_NAME}.com"
  provider          = "aws.us_east_1"
  validation_method = "DNS"

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "acm"
    tech    = "tls"
    Name    = "${var.APP_NAME}_${var.APP_ENV}_tls_certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  name     = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_name}"
  provider = "aws.us_east_1"
  records  = ["${aws_acm_certificate.cert.domain_validation_options.0.resource_record_value}"]
  ttl      = 60
  type     = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_type}"
  zone_id  = "${data.aws_route53_zone.zone.id}"
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = "${aws_acm_certificate.cert.arn}"
  provider                = "aws.us_east_1"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}
