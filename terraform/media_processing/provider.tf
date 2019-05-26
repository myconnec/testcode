provider "aws" {
  alias  = "region"
  region = "${var.AWS_REGION}"
}
