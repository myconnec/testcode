#!/bin/bash -e

echo "Syncing changes from local ./app to remote ~/connechub/app..."

# fswatch -0 -o $(pwd)/app/* | \
# xargs -0 -I {} \
rsync -arvz -e "ssh -i ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem" \
$(pwd)/app/ \
ubuntu@$(terraform output aws_instance_web_app_dns):/home/ubuntu/connechub/app

echo "...done."
