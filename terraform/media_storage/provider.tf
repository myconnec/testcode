provider "aws" {
    # "${replace("foo","foo","bar")}"
    # alias = "us_east_1"
    # alias = "${replace("${var.AWS_REGION}", "-", "_")}"
    # providers can not used interpolated values. :()
    alias = "us-east-1"
    region = "${var.AWS_REGION}"
}
