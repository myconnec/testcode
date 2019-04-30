# EC2

resource "aws_instance" "web_app" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  associate_public_ip_address = true
  instance_type               = "${var.COMPUTE_SIZE}"

  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"

  key_name = "${var.AWS_PEM_KEY_PAIR}"

  provisioner "local-exec" {
    command = "./terraform/web_app/ansible.sh"
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Ruby on Rails"
    testing = 2
  }

  vpc_security_group_ids = [
    "${aws_security_group.ec2_security_group_http.name}",
    "${aws_security_group.ec2_security_group_https.name}",
    "${aws_security_group.rds_security_group_mysql.name}",
    "${aws_security_group.ec2_security_group_ssh.name}",
  ]
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_web_instance_profile"
  role = "${aws_iam_role.ec2_web_server_role.name}"
}
