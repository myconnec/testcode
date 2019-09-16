# EC2

## Instances

resource "aws_instance" "web_app" {
  ami                  = "${data.aws_ami.canonical_ubuntu.id}"
  # iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  instance_type        = "${var.COMPUTE_SIZE}"
  key_name             = "${var.AWS_PEM_KEY_PAIR}"

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "EC2"
    tech    = "Ruby on Rails"
  }

  user_data = "${file("./ec2_web_app_start.sh")}" # source https://www.bogotobogo.com/DevOps/Terraform/Terraform-terraform-userdata.php

  security_groups = [
    "${aws_security_group.https.name}",
    "${aws_security_group.ssh.name}",
  ]
}

## AMI

resource "aws_ami_from_instance" "web_app_ec2_base_ami" {
  name               = "${var.APP_ENV}-base-ami"
  source_instance_id = "${aws_instance.web_app.id}"

  tags = {
    app     = "${var.APP_NAME}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "EC2"
    tech    = "AMI"
  }
}

