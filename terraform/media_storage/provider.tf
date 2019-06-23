provider "aws" {
  alias  = "region_1"
  region = "${var.AWS_REGION}"
}

resource "random_uuid" "provider" {}
