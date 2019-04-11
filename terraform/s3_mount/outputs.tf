output "EC2_web_host_ip" {
  value = "${aws_instance.web.public_ip}"
}
