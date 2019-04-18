# Notes this is currently only a proof of concept.
# CH will require 2 Transcoders: free and paid
# data

module "s3_lambda_transcoder_event" {
  source  = "./auto_trigger/"
  version = "0.0.1"

  # variables
  SOURCE_BUCKET_ARN  = "${aws_s3_bucket.raw_media.arn}"
  SOURCE_BUCKET_NAME = "${aws_s3_bucket.raw_media.bucket}"
  APP_ENV            = "${var.APP_ENV}"
}

# IAM Policy
data "aws_iam_policy" "transcoder_full_access_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonElasticTranscoder_FullAccess"
}

data "aws_iam_policy" "s3_full_access_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# resources

# S3 bucket for raw video
resource "aws_s3_bucket" "raw_media" {
  acl = "private"

  bucket = "raw-media-${var.APP_ENV}"

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

# S3 bucket for processed video ACL settings
resource "aws_s3_bucket_public_access_block" "raw_media_settings" {
  bucket = "${aws_s3_bucket.raw_media.id}"

  block_public_acls   = true
  block_public_policy = true

  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 bucket for processed video
resource "aws_s3_bucket" "processed_media" {
  acl           = "private"
  bucket        = "processed-media-${var.APP_ENV}"
  force_destroy = false                            #"${var.APP_ENV != "PRD" ? true : false}"
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

# S3 bucket for processed video ACL settings
resource "aws_s3_bucket_public_access_block" "processed_media_settings" {
  bucket = "${aws_s3_bucket.processed_media.id}"

  block_public_acls   = true
  block_public_policy = true

  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Transcoder preset

# Transcoder pipeline
resource "aws_elastictranscoder_pipeline" "transcoder_pipeline" {
  content_config {
    bucket        = "${aws_s3_bucket.processed_media.bucket}"
    storage_class = "Standard"
  }

  input_bucket = "${aws_s3_bucket.raw_media.bucket}"
  name         = "transcoder_pipeline"
  role         = "${aws_iam_role.transcoder_role.arn}"

  thumbnail_config {
    bucket        = "${aws_s3_bucket.processed_media.bucket}"
    storage_class = "Standard"
  }
}

# Transcoder IAM Role
resource "aws_iam_role" "transcoder_role" {
  name        = "CHTranscoder"
  description = "Allow AWS ElasticTranscoder access S3, transcoder a video, and save to the target S3 bucket."

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "elastictranscoder.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

# Transcoder IAM Role policy attachment
resource "aws_iam_role_policy_attachment" "transcoder_role_policy_attachment" {
  role       = "${aws_iam_role.transcoder_role.name}"
  policy_arn = "${data.aws_iam_policy.transcoder_full_access_policy.arn}"
}

resource "aws_iam_role_policy_attachment" "transcoder_role_policy_attachment_2" {
  role       = "${aws_iam_role.transcoder_role.name}"
  policy_arn = "${data.aws_iam_policy.s3_full_access_policy.arn}"
}

# Transcoder Preset
resource "aws_elastictranscoder_preset" "transcodser_preset" {
  container   = "mp4"
  description = "POC Transcoder to convert source to destination."
  name        = "POC_Transcoder"

  # audio {
  #   audio_packing_mode = "SingleTrack"
  #   bit_rate           = 96
  #   channels           = 2
  #   codec              = "AAC"
  #   sample_rate        = 44100
  # }


  # audio_codec_options {
  #   profile = "AAC-LC"
  # }

  video {
    bit_rate             = "1600"
    codec                = "H.264"
    display_aspect_ratio = "16:9"
    fixed_gop            = "false"
    frame_rate           = "auto"
    max_frame_rate       = "60"
    keyframes_max_dist   = 240
    max_height           = "auto"
    max_width            = "auto"
    padding_policy       = "Pad"
    sizing_policy        = "Fit"
  }
  video_codec_options = {
    Profile                  = "main"
    Level                    = "2.2"
    MaxReferenceFrames       = 3
    InterlacedMode           = "Progressive"
    ColorSpaceConversionMode = "None"
  }

  # video_watermarks {
  #   id                = "Terraform Test"
  #   max_width         = "20%"
  #   max_height        = "20%"
  #   sizing_policy     = "ShrinkToFit"
  #   horizontal_align  = "Right"
  #   horizontal_offset = "10px"
  #   vertical_align    = "Bottom"
  #   vertical_offset   = "10px"
  #   opacity           = "55.5"
  #   target            = "Content"
  # }

  thumbnails {
    format         = "png"
    interval       = 120
    max_width      = "auto"
    max_height     = "auto"
    padding_policy = "Pad"
    sizing_policy  = "Fit"
  }
}
