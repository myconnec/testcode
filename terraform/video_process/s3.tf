# S3

# Bucket

resource "aws_s3_bucket" "media_source" {
  acl = "private"
  bucket        = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}-${var.APP_ENV}"

  force_destroy = "${var.APP_ENV != "PRD" ? true : false}"
  provider      = "aws.us_east_1"
  region        = "us-west-1"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "S3"
    tech    = "Storage"
  }
}

resource "aws_s3_bucket" "media_display" {
  acl           = "private"
  bucket        = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}-${var.APP_ENV}"
  force_destroy = "${var.APP_ENV != "prd" ? true : false}"
  provider      = "aws.us_east_1"
  region        = "us-west-1"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "S3"
    tech    = "Storage"
  }
}

# ACLs

resource "aws_s3_bucket_public_access_block" "media_source_settings" {
  bucket = "${aws_s3_bucket.media_source.id}"

  block_public_acls   = true
  block_public_policy = true

  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "media_display_settings" {
  bucket = "${aws_s3_bucket.media_display.id}"

  block_public_acls   = true
  block_public_policy = true

  ignore_public_acls      = true
  restrict_public_buckets = true
}
