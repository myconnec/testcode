output "EC2_web_host_ip" {
  value = "${aws_eip.eip.public_ip}"
}

output "SQL_host_dns_addr" {
  value = "${aws_db_instance.rds.address}"
}

