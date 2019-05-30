# EC2

## Instances

resource "aws_instance" "web_app" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  associate_public_ip_address = true
  instance_type               = "${var.COMPUTE_SIZE}"

  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"

  key_name = "${var.AWS_PEM_KEY_PAIR}"

  # TODO: can not seem to get this to work correctly :S
  # provisioner "local-exec" {
  #   command = "./terraform/web_app/web_app.sh $(terraform output web_app_public_ip) ${var.APP_ENV} ${var.APP_NAME} ${var.AWS_REGION} ${var.media_display_bucket_id} ${var.media_source_bucket_id} $(terraform output database_address) ${var.AWS_PEM_KEY_PAIR}"
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

## EC2 Profiles

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.APP_NAME}_ec2_web_instance_profile_${var.APP_ENV}"
  role = "${aws_iam_role.ec2_web_server_role.name}"
}
