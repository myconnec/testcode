output "IP" {
  value = "${module.ec2_with_s3_mounted.ip}"
}

output "AWS_ACCESS_KEY" {
  value = "${module.ec2_with_s3_mounted.id}"
}

output "AWS_SECRET_KEY" {
  value = "${module.ec2_with_s3_mounted.secret}"
}