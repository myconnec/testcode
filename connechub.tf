module "web_app" {
  source  = "./terraform/web_app"
  version = "0.0.1"

  # variables
  APP_ENV          = "${var.APP_ENV}"
  APP_NAME         = "${var.APP_NAME}"
  AWS_REGION       = "${var.AWS_REGION}"
  AWS_PEM_KEY_PAIR = "${var.AWS_PEM_KEY_PAIR}"
  DB_USER          = "${var.DB_USER}"
  DB_PASS          = "${var.DB_PASS}"
}


# Video asset processing
module "video_processing" {
  source  = "./terraform/video_process"
  version = "0.0.1"

  # variables
  APP_ENV    = "${var.APP_ENV}"
  APP_NAME   = "${var.APP_NAME}"
  AWS_REGION = "${var.AWS_REGION}"
  AWS_S3_MEDIA_DISPLAY_BUCKET = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}"
  AWS_S3_MEDIA_SOURCE_BUCKET = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}"
}

module "lambda_s3_to_transcoder" {
  source  = "./terraform/lambda_s3_to_transcoder/"
  version = "0.0.1"

  # variables
  APP_ENV            = "${var.APP_ENV}"
  AWS_S3_MEDIA_SOURCE_BUCKET = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}"

  video_process_media_source_bucket_arn  = "${module.video_processing.video_process_media_source_bucket_arn}"
}
