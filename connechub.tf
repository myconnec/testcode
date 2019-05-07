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
