# Transcoder pipeline
resource "aws_elastictranscoder_pipeline" "transcoder_pipeline" {
  # output bucket for video
  content_config {
    bucket        = "${var.media_display_bucket_id}"
    storage_class = "Standard"
  }

  # input source media
  input_bucket = "${var.media_source_bucket_id}"
  name         = "${var.APP_NAME}_transcoder_pipeline__${var.APP_ENV}"
  role         = "${aws_iam_role.transcoder_role.arn}"

  # output bucket for thumbnails
  thumbnail_config {
    bucket        = "${var.media_display_bucket_id}"
    storage_class = "Standard"
  }
}
