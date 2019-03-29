output "SSH_Command_For_Access" {
  value = "${aws_eip.eip.public_ip}"
}