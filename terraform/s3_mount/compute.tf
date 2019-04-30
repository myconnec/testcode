# Compute Resources

## EC2
resource "aws_instance" "web" {
  associate_public_ip_address = true
  instance_type               = "${var.compute_size}"

  ami = "${data.aws_ami.ubuntu.id}"

  key_name = "${var.AWS_PEM_KEY_PAIR}"

  provisioner "local-exec" {
    command = "./terraform/s3_mount/s3_mount.sh ${aws_instance.web.public_ip} ${var.APP_ENV} ${var.AWS_PEM_KEY_PAIR} ${var.AWS_REGION} ${var.AWS_S3_MEDIA_DISPLAY_BUCKET} ${var.AWS_S3_MEDIA_SOURCE_BUCKET}"
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "EC2"
    tech    = "Ruby on Rails"
    Name    = "RoR web server"
  }

  security_groups = [
    "${aws_default_security_group.default.name}",
    "${aws_security_group.ec2_security_group_https.name}",
    "${aws_security_group.ec2_security_group_ssh.name}",
  ]
}
