output "tls_domain_name" {
  value = "${aws_acm_certificate.cert.domain_name}"
}

output "tls_arn" {
  value = "${aws_acm_certificate.cert.arn}"
}
