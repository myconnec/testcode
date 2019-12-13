#!/bin/bash

export $(grep -v '^#' .env | xargs)
printenv | sort | grep APP_*
printenv | sort | grep AWS_*

packer build ./packer/ec2_web_server.json
