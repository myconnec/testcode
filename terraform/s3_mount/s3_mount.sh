#!/bin/bash +xe

echo 'Giving the compute instance a chance to start up...'
#sleep 60;

echo 'Exporting Ansible settings...'
export ANSIBLE_NOCOWS=1
export ANSIBLE_DEBUG=0
export ANSIBLE_HOST_KEY_CHECKING=0
export ANSIBLE_STDOUT_CALLBACK=minimal

echo 'Executing Ansible playbook...'
ansible-playbook \
    -i ''$(terraform output EC2_web_host_ip)',' \
    -u ubuntu \
    --extra-vars='{"APP_ENV": "'$1'", "AWS_S3_MEDIA_SOURCE_BUCKET": "'$2'", "AWS_S3_MEDIA_DISPLAY_BUCKET": "'$3'"}' \
    --private-key ~/.ssh/aws-connechub-test-dje.pem \
    ./ansible/s3_mount.yml

echo '...done.'
