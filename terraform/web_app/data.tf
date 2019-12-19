# Data

## compute base image
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"

    # values = ["connechub_web_app"]
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # owners = ["345292015349"] # ConnecHub
  owners = ["099720109477"] # Canonical us-east-1
}

data "http" "local_ip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_subnet_ids" "web_app" {
  vpc_id = aws_default_vpc.default.id
}

