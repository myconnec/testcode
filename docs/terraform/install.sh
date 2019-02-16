#!/bin/bash -e
export TF_VERSION=0.11.11

mkdir ./tmp/terraform
cd ./tmp/terraform
wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_SHA256SUMS
# TODO: add checksum comparison

unzip terraform_${TF_VERSION}_linux_amd64.zip
cd ./terraform

cp -f ./terraform /usr/local/bin
chmod +x  /usr/local/bin/terraform

terraform --version

cd ../../
