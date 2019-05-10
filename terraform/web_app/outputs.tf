output "web_app_public_ip" {
  value = "${aws_eip.web_app.public_ip}"
}

output "database_address" {
  value = "${aws_db_instance.rds.address}"
}
