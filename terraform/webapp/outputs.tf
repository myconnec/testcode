output "EC2_web_host_ip" {
  value = "${aws_eip.eip.public_ip}"
}
