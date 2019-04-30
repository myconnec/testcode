# Storage

## Buckets
resource "aws_s3_bucket" "media_display_bucket" {
  acl = "private"

  bucket = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}-${var.APP_ENV}"

  force_destroy = "${var.APP_ENV != "prd" ? true : false}"

  # https://github.com/hashicorp/terraform/issues/12512
  region = "us-east-1" # Must be us-east-1 to mount as a file system dir.

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

resource "aws_s3_bucket" "media_source_bucket" {
  acl    = "private"
  bucket = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}-${var.APP_ENV}"

  force_destroy = "${var.APP_ENV != "prd" ? true : false}"

  # https://github.com/hashicorp/terraform/issues/12512
  region = "us-east-1" # Must be us-east-1 to mount as a file system dir.

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

## Bucket ACLs

resource "aws_s3_bucket_public_access_block" "media_display_bucket" {
  bucket = "${aws_s3_bucket.media_display_bucket.id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "media_source_bucket" {
  bucket = "${aws_s3_bucket.media_source_bucket.id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
