#!/bin/bash -xe

# echo "First run will take a few moments to build the rsync cache. Please be patient..."
# rsync -avc --delete --progress -e "ssh -i ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem" \
# ./app/ \
# ubuntu@$(terraform output aws_instance_web_app_dns):/home/ubuntu/connechub/app

echo "Now we are watching the ./app dir for changes..."
fswatch -0 -o ./app | \
xargs -0 -I {} \
rsync -avc --delete --progress -e "ssh -i ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem" \
./app/ \
ubuntu@$(terraform output aws_instance_web_app_dns):/home/ubuntu/connechub/app
