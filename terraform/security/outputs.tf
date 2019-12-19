output "tls_domain_name" {
  value = aws_acm_certificate.cert.domain_name
}

output "tls_arn" {
  value = aws_acm_certificate.cert.arn
}

# output "tls_cf_arn" {
#   value = "${aws_acm_certificate.cf_cert.arn}"
# }
