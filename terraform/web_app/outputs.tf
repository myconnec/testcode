output "web_app_public_ip" {
  value = "${aws_eip.web_app.public_ip}"
}

output "database_address" {
  value = "${aws_db_instance.rds.address}"
}

output "route53_record_subdomain_name" {
  value = "${aws_route53_record.subdomain.name}"
}