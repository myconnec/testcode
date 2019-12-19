# EC2

## Instances

resource "aws_instance" "web_app" {
  ami                  = data.aws_ami.ubuntu.id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  instance_type        = var.COMPUTE_SIZE
  key_name             = var.AWS_PEM_KEY_PAIR

  tags = {
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "EC2"
    tech    = "Ruby on Rails"
  }

  # source https://www.bogotobogo.com/DevOps/Terraform/Terraform-terraform-userdata.php
  # source https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html
  # script is saved to /var/lib/cloud/instances/instance-id/
  # user_data = file("./terraform/web_app/ec2_web_app_start.sh")

  security_groups = [
    aws_security_group.mysql.name,
    aws_security_group.puma.name,
    aws_security_group.ssh.name,
  ]
}

## EC2 Profiles

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.APP_NAME}_ec2_web_instance_profile_${var.APP_ENV}"
  role = aws_iam_role.ec2_web_server_role.name
}

