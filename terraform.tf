module "web-app" {
  source = "./terraform/webapp"
  version = "0.0.1"

  # variables
  "APP_ENV" = ""
  "APP_NAME" = ""
  "AWS_REGION" = ""
  "AWS_ACCESS_KEY" = ""
  "AWS_SECRET_KEY" = ""
  "AWS_PEM_KEY_PAIR" = ""
  "DB_USER" = ""
  "DB_PASS" = ""
}

