# Data

## compute base image
data "aws_ami" "canonical_ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # Canonical
  owners = ["099720109477"]
}

data "http" "local_ip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_subnet_ids" "web_app" {
  vpc_id = "${aws_default_vpc.default.id}"
}