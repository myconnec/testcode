
# Bucket
resource "aws_s3_bucket" "log_storage" {
  acl           = "private"
  bucket        = "log-storage-${random_uuid.provider.result}-${var.APP_ENV}"
  force_destroy = "${var.APP_ENV != "prd" ? true : false}"
  provider      = "aws.us_west_1"
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
    owner   = "admin@connechub.com"
    service = "S3"
    tech    = "Storage"
  }
}

# ACLs

resource "aws_s3_bucket_public_access_block" "logging" {
  bucket = "${aws_s3_bucket.log_storage.id}"

  block_public_acls   = true
  block_public_policy = true

  depends_on = ["aws_s3_bucket.log_storage"]

  ignore_public_acls      = true
  restrict_public_buckets = true
}
