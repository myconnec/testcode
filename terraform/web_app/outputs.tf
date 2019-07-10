output "database_address" {
  value = "${aws_db_instance.rds.address}"
}

output "ec2_public_dns" {
  value = "${aws_instance.web_app.public_dns}"
}

output "route53_record_subdomain_name" {
  value = "${aws_route53_record.subdomain.name}"
}

output "aws_instance_web_app_dns" {
  value = "${aws_instance.web_app.public_dns}"
}
