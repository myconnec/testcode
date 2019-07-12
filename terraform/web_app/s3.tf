# S3

# Bucket
resource "aws_s3_bucket" "web_app_log" {
  acl           = "private"
  bucket        = "${var.APP_NAME}-logs-${var.APP_ENV}"
  force_destroy = "${var.APP_ENV != "prd" ? true : false}"
  provider      = "aws.region_1"
  region        = "${var.AWS_REGION}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    app     = "${var.APP_NAME}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "S3"
    tech    = "storage"
  }
}

# ACLs

resource "aws_s3_bucket_public_access_block" "web_app_log_settings" {
  bucket = "${aws_s3_bucket.web_app_log.id}"

  block_public_acls   = true
  block_public_policy = true

  depends_on = ["aws_s3_bucket.web_app_log"]

  ignore_public_acls      = true
  restrict_public_buckets = true
}
