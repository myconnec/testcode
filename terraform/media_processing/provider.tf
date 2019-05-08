provider "aws" {
  alias  = "us_east_1"
  region = "${var.AWS_REGION}"
}
