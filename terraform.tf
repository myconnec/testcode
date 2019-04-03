# module "web-app" {
#   source = "./terraform/webapp"
#   version = "0.0.1"

#    # variables
#   APP_ENV = "${var.APP_ENV}"
#   APP_NAME = "${var.APP_NAME}"
#   AWS_REGION = "${var.AWS_REGION}"
#   AWS_ACCESS_KEY = "${var.AWS_ACCESS_KEY}"
#   AWS_SECRET_KEY = "${var.AWS_SECRET_KEY}"
#   AWS_PEM_KEY_PAIR = "${var.AWS_PEM_KEY_PAIR}"
#   DB_USER = "${var.DB_USER}"
#   DB_PASS = "${var.DB_PASS}"
# }

# Video asset processing
module "video-processing" {
  source = "./terraform/videoprocessing"
  version = "0.0.1"

  # variables
  APP_ENV = "${var.APP_ENV}"
  APP_NAME = "${var.APP_NAME}"
  AWS_REGION = "${var.AWS_REGION}"
}
