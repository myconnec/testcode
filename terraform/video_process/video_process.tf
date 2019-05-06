# module "s3_lambda_transcoder_event" {
#   source  = "../auto_trigger/"
#   version = "0.0.1"

#   # variables
#   SOURCE_BUCKET_ARN  = "${aws_s3_bucket.raw_media.arn}"
#   SOURCE_BUCKET_NAME = "${aws_s3_bucket.raw_media.bucket}"
#   APP_ENV            = "${var.APP_ENV}"
# }

# Transcoder pipeline
resource "aws_elastictranscoder_pipeline" "transcoder_pipeline" {
  # output bucket for video
  content_config {
    bucket        = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}"
    storage_class = "Standard"
  }

  # input source media
  input_bucket = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}"
  name         = "${var.APP_ENV}_transcoder_pipeline"
  role         = "${aws_iam_role.transcoder_role.arn}"

  # output bucket for thumbnails
  thumbnail_config {
    bucket        = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}"
    storage_class = "Standard"
  }
}

# Transcoder Preset
resource "aws_elastictranscoder_preset" "transcodser_preset_free" {
  container   = "mp4"
  description = "Transcoder preset to use for free accounts.."
  name        = "Transcoder_Free"

  audio {
    audio_packing_mode = "SingleTrack"
    bit_rate           = 64
    channels           = 1
    codec              = "mp3"
    sample_rate        = 22050 #44100
  }

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
