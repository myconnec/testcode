locals {
  web_host_uri = "https://${var.APP_ENV}.${var.APP_NAME}.com"
}

# Bucket
resource "aws_s3_bucket" "media_display" {
  acl           = "public-read"
  bucket        = var.AWS_S3_MEDIA_DISPLAY_BUCKET
  force_destroy = var.APP_ENV == "www" ? false : true
  provider      = aws.region_1
  region        = var.AWS_REGION

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
    # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
    # force an interpolation expression to be interpreted as a list by wrapping it
    # in an extra set of list brackets. That form was supported for compatibility in
    # v0.11, but is no longer supported in Terraform v0.12.
    #
    # If the expression in the following list itself returns a list, remove the
    # brackets to avoid interpretation as a list of lists. If the expression
    # returns a single list item then leave it as-is and remove this TODO comment.
    allowed_origins = [local.web_host_uri]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }

  lifecycle_rule {
    id      = "media_display_lifecycle"
    enabled = true

    expiration {
      days = var.APP_ENV == "www" ? 1 : 35
    }

    tags = {
      "rule"      = "log"
      "autoclean" = "true"
    }
  }

  tags = {
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "S3"
    tech    = "Storage"
  }
}

resource "aws_s3_bucket" "media_source" {
  acl           = "private"
  bucket        = var.AWS_S3_MEDIA_SOURCE_BUCKET
  force_destroy = var.APP_ENV == "www" ? false : true
  provider      = aws.region_1
  region        = var.AWS_REGION

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
    # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
    # force an interpolation expression to be interpreted as a list by wrapping it
    # in an extra set of list brackets. That form was supported for compatibility in
    # v0.11, but is no longer supported in Terraform v0.12.
    #
    # If the expression in the following list itself returns a list, remove the
    # brackets to avoid interpretation as a list of lists. If the expression
    # returns a single list item then leave it as-is and remove this TODO comment.
    allowed_origins = [local.web_host_uri]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }

  lifecycle_rule {
    id      = "media_source_lifecycle"
    enabled = true

    expiration {
      days = var.APP_ENV == "www" ? 1 : 35
    }

    tags = {
      "rule"      = "log"
      "autoclean" = "true"
    }
  }

  tags = {
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "S3"
    tech    = "Storage"
  }
}

resource "aws_s3_bucket" "media_profile" {
  acl           = "private"
  bucket        = var.AWS_S3_MEDIA_PROFILE_BUCKET
  force_destroy = var.APP_ENV == "www" ? false : true
  provider      = aws.region_1
  region        = var.AWS_REGION

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
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }

  tags = {
    app     = var.APP_NAME
    env     = var.APP_ENV
    owner   = var.CONTACT_EMAIL
    service = "S3"
    tech    = "Storage"
  }
}

# ACLs

resource "aws_s3_bucket_public_access_block" "media_display_settings" {
  bucket = aws_s3_bucket.media_display.id

  block_public_acls   = true
  block_public_policy = true

  depends_on = [aws_s3_bucket.media_display]

  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "media_source_settings" {
  bucket = aws_s3_bucket.media_source.id

  block_public_acls   = true
  block_public_policy = true

  depends_on = [aws_s3_bucket.media_source]

  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "media_profile_settings" {
  bucket = aws_s3_bucket.media_profile.id

  block_public_acls   = true
  block_public_policy = true

  depends_on = [aws_s3_bucket.media_profile]

  ignore_public_acls      = true
  restrict_public_buckets = true
}

