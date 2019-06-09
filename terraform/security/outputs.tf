output "security_tls_domain_name" {
  value = "${aws_acm_certificate.cert.domain_name}"
}

output "security_tls_arn" {
  value = "${aws_acm_certificate.cert.arn}"
}
