# S3

# Bucket

resource "aws_s3_bucket" "raw_media" {
  acl = "private"
  bucket        = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}-${var.APP_ENV}"

  force_destroy = false               #"${var.APP_ENV != "PRD" ? true : false}"
  region        = "${var.AWS_REGION}"

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

resource "aws_s3_bucket" "processed_media" {
  acl           = "private"
  bucket        = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}-${var.APP_ENV}"
  force_destroy = false #"${var.APP_ENV != "PRD" ? true : false}"
  region        = "${var.AWS_REGION}"

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

resource "aws_s3_bucket_public_access_block" "raw_media_settings" {
  bucket = "${aws_s3_bucket.raw_media.id}"

  block_public_acls   = true
  block_public_policy = true

  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "processed_media_settings" {
  bucket = "${aws_s3_bucket.processed_media.id}"

  block_public_acls   = true
  block_public_policy = true

  ignore_public_acls      = true
  restrict_public_buckets = true
}
