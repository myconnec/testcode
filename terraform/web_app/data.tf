# Data

## compute base image
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"

    # us-east-1 ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320 ami-0c8b8e32659017cc5
    # us-west-1 ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190320 ami-0f1d0daf2937d0064
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}