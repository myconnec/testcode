output "database_address" {
  value = "${aws_db_instance.rds.address}"
}

output "route53_record_subdomain_name" {
  value = "${aws_route53_record.subdomain.name}"
}
