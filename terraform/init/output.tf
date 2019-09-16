output "aws_id" {
  value = "${aws_ami_from_instance.web_app_ec2_base_ami.id}"
}

output "ec2_public_dns" {
  value = "${aws_instance.web_app.public_dns}"
}