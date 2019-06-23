# Data Sources

data "template_file" "bucket_access_policy" {
  template = "${file("./terraform/media_storage/policies/bucketaccesspolicy.tpl")}"  
  vars {
    APP_ENV = "${var.APP_ENV}"
  }
}