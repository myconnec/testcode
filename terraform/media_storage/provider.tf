provider "aws" {
  alias  = "us_west_1"
  region = "${var.AWS_REGION}"
}
