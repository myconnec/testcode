#!/bin/bash -xe
ssh -i ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem ubuntu@$(terraform output aws_instance_web_app_dns)
