# EC2

resource "aws_instance" "web_app" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  associate_public_ip_address = true
  instance_type               = "${var.COMPUTE_SIZE}"

  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"

  key_name = "${var.AWS_PEM_KEY_PAIR}"

  # provisioner "local-exec" {
  #   command = "./terraform/web_app/ansible.sh"
  # }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Ruby on Rails"
  }
  security_groups = [
    "${aws_default_security_group.default.name}",
    "${aws_security_group.http.name}",
    "${aws_security_group.https.name}",
    "${aws_security_group.mysql.name}",
    "${aws_security_group.ssh.name}",
  ]
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_web_instance_profile"
  role = "${aws_iam_role.ec2_web_server_role.name}"
}
