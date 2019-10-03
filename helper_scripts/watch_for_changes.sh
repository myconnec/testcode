#!/bin/bash -xe

echo "Syncing local file to remote..."

# fswatch -0 -o -e .git/ -e .pyc -e $(pwd)/static . | xargs -0 -I {}

rsync -avzP -e "ssh -i ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem" \
./app \
ubuntu@$(terraform output aws_instance_web_app_dns):/home/ubuntu/connechub/app

echo "...done."
