locals {
  web_host_uri = "https://${var.APP_HOST}"
}

# Bucket
resource "aws_s3_bucket" "media_display" {
  acl           = "private"
  bucket        = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}"
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

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["${local.web_host_uri}"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }

  tags = {
    app     = "${var.APP_NAME}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "S3"
    tech    = "Storage"
  }
}

resource "aws_s3_bucket" "media_source" {
  acl           = "private"
  bucket        = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}"
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

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["POST", "PUT"]
    allowed_origins = ["${local.web_host_uri}"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }

  tags = {
    app     = "${var.APP_NAME}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "S3"
    tech    = "Storage"
  }
}

# ACLs

resource "aws_s3_bucket_public_access_block" "media_display_settings" {
  bucket = "${aws_s3_bucket.media_display.id}"

  block_public_acls   = true
  block_public_policy = true

  depends_on = ["aws_s3_bucket.media_display"]

  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "media_source_settings" {
  bucket = "${aws_s3_bucket.media_source.id}"

  block_public_acls   = true
  block_public_policy = true

  depends_on = ["aws_s3_bucket.media_source"]

  ignore_public_acls      = true
  restrict_public_buckets = true
}
