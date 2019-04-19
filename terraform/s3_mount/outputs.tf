output "EC2_web_host_ip" {
  value = "${module.s3_mount.EC2_web_host_ip}"
}
 output "SQL_host_dns_addr" {
   value ="${module.webapp.SQL_host_dns_addr}"
 }
output "AWS_S3_MEDIA_SOURCE_BUCKET" {
  value = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}-${var.APP_ENV}"
}
output "AWS_S3_MEDIA_DISPLAY_BUCKET" {
  value = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}-${var.APP_ENV}"
}

