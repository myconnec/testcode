#!/bin/bash +xe

echo 'Giving the compute instance a chance to start up...'
sleep 60

echo 'Exporting Ansible settings...'
export ANSIBLE_NOCOWS=1
export ANSIBLE_DEBUG=0
export ANSIBLE_HOST_KEY_CHECKING=0
export ANSIBLE_STDOUT_CALLBACK=minimal

echo 'Executing Ansible playbook...'
printf "Vars: $1, $2, $3, $4, $5, $6"
ansible-playbook \
    -i ''$1','  \
    -u ubuntu \
    --extra-vars='{"APP_ENV": "'$2'", "AWS_REGION": "'$4'", "AWS_S3_MEDIA_DISPLAY_BUCKET": "'$5'", "AWS_S3_MEDIA_SOURCE_BUCKET": "'$6'"}' \
    --private-key ~/.ssh/$3.pem \
    ./terraform/s3_mount/s3_mount.yml

echo '...done.'