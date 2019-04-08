
output "id" {
  value = "${aws_iam_access_key.ec2_to_s3.id}"
}

output "secret" {
  value = "${aws_iam_access_key.ec2_to_s3.secret}"
}