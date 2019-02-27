provider "aws" {
  region                  = "us-east-2"
  shared_credentials_file = "~/.aws/creds"
  profile                 = "connechub"
}

terraform {
  backend "s3" {
    bucket = "terraform-remote-state-connechub-test"
    encrypt = true
    key = "terraform.tfstate"
  }
}
