module "web_app" {
  source  = "./terraform/web_app"
  version = "0.0.1"

  # variables
  APP_ENV          = "${var.APP_ENV}"
  APP_NAME         = "${var.APP_NAME}"
  AWS_REGION       = "${var.AWS_REGION}"
  # AWS_ACCESS_KEY   = "${var.AWS_ACCESS_KEY}"
  # AWS_SECRET_KEY   = "${var.AWS_SECRET_KEY}"
  AWS_PEM_KEY_PAIR = "${var.AWS_PEM_KEY_PAIR}"
  DB_USER          = "${var.DB_USER}"
  DB_PASS          = "${var.DB_PASS}"
}

# S3 Bucket Mounting
# module "s3_mount" {
#   source  = "./terraform/s3_mount"
#   version = "0.0.1"

#   # variables
#   APP_ENV                     = "${var.APP_ENV}"
#   APP_NAME                    = "${var.APP_NAME}"
#   AWS_REGION                  = "${var.AWS_REGION}"
#   AWS_PEM_KEY_PAIR            = "${var.AWS_PEM_KEY_PAIR}"
#   AWS_S3_MEDIA_DISPLAY_BUCKET = "${var.AWS_S3_MEDIA_DISPLAY_BUCKET}"
#   AWS_S3_MEDIA_SOURCE_BUCKET  = "${var.AWS_S3_MEDIA_SOURCE_BUCKET}"
# }

# Video asset processing
# module "video-processing" {
#   source  = "./terraform/video_processing"
#   version = "0.0.1"

#   # variables
#   APP_ENV    = "${var.APP_ENV}"
#   APP_NAME   = "${var.APP_NAME}"
#   AWS_REGION = "${var.AWS_REGION}"
# }
