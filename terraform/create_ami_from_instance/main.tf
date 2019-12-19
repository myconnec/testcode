resource "aws_ami_from_instance" "web_app_ec2_base_ami" {
  name               = "${var.APP_ENV}-base-ami"
  source_instance_id = var.web_app_ec2_id

  tags = {
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "EC2"
    tech    = "AMI"
  }
}

