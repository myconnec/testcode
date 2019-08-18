# EC2

## Instances

resource "aws_instance" "web_app" {
  ami                  = "${data.aws_ami.ubuntu.id}"
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  instance_type        = "${var.COMPUTE_SIZE}"
  key_name             = "${var.AWS_PEM_KEY_PAIR}"

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Ruby on Rails"
  }

  security_groups = [
    "${aws_security_group.mysql.name}",
    "${aws_security_group.puma.name}",
    "${aws_security_group.ssh.name}",
  ]
}

## EC2 Profiles

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.APP_NAME}_ec2_web_instance_profile_${var.APP_ENV}"
  role = "${aws_iam_role.ec2_web_server_role.name}"
}
