#!/bin/bash +xe

printf 'Starting Ansible playbook...\n'

ansible-playbook \
    -i $(terraform output aws_instance_web_app_dns), \
    -u ubuntu \
    --extra-vars='{
        "APP_ENV": "'${APP_ENV}'",
        "APP_NAME": "'${APP_NAME}'",
        "AWS_REGION": "'${AWS_REGION}'",
        "SSH_KEY_ID": "'${SSH_KEY_ID}'",
        "database_address": "'$(terraform output database_address)'",
        "media_profile_bucket_id": "'$(terraform output media_profile_bucket_id)'"
    }' \
    --private-key ~/.ssh/${AWS_PEM_KEY_PAIR}.pem \
    ./ansible/web_app.yml

printf '...done.\n\n'
