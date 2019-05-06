#!/bin/bash +xe

echo 'Giving the compute and database instances a chance to start up...'
sleep 120;

echo 'Exporting Ansible settings...'
export ANSIBLE_NOCOWS=1
export ANSIBLE_DEBUG=0
export ANSIBLE_HOST_KEY_CHECKING=0
export ANSIBLE_STDOUT_CALLBACK=minimal

echo 'Executing Ansible playbook...'
ansible-playbook \
    -i ''"$(terraform output web_app_public_ip)"',' \
    -u ubuntu \
    --extra-vars='{
        "APP_ENV": "'$(terraform output APP_ENV)'",
        "AWS_REGION": "'$(terraform output AWS_REGION)'",
        "AWS_S3_MEDIA_DISPLAY_BUCKET": "'$(terraform output AWS_S3_MEDIA_DISPLAY_BUCKET)'",
        "AWS_S3_MEDIA_SOURCE_BUCKET": "'$(terraform output AWS_S3_MEDIA_SOURCE_BUCKET)'",
        "database_address": "'$(terraform output database_address)'"
    }' \
    --private-key ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem \
    ./terraform/web_app/web_app.yml

echo '...done.'
