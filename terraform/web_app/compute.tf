# ec2

## instances

## instance profile

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.APP_NAME}_ec2_web_instance_profile_${var.APP_ENV}"
  role = "${aws_iam_role.ec2_web_server_role.name}"
}
