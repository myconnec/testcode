# Data

## compute base image
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"

    # us-east-1 ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320 ami-0c8b8e32659017cc5
    # us-west-1 ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320 ami-0f1d0daf2937d0064
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320"]
    # values = ["connechub_web_app"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # owners = ["345292015349"] # ConnecHub
  owners = ["099720109477"] # Canonical us-west-1
}

data "http" "local_ip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_subnet_ids" "web_app" {
  vpc_id = "${aws_default_vpc.default.id}"
}

data "aws_subnet" "web_app" {
  # count = "${length(data.aws_subnet_ids.web_app.ids)}"
  id = "${data.aws_subnet_ids.web_app.ids[count.index]}"
}
