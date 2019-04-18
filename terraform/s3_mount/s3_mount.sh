#!/bin/bash +xe

printf 'Giving the compute instance a chance to start up...'
sleep 60;

printf 'Exporting Ansible settings...'
export ANSIBLE_NOCOWS=1
export ANSIBLE_DEBUG=0
export ANSIBLE_HOST_KEY_CHECKING=0
export ANSIBLE_STDOUT_CALLBACK=minimal

printf "Executing Ansible playbook with the following variables: $1 $2 $3 $4"
ansible-playbook \
    -i ''$1','  \
    -u ubuntu \
    --extra-vars='{"APP_ENV": "'$2'", "AWS_S3_MEDIA_SOURCE_BUCKET": "'$3'", "AWS_S3_MEDIA_DISPLAY_BUCKET": "'$4'"}' \
    --private-key ~/.ssh/aws-connechub-test-dje.pem \
    ./terraform/s3_mount/s3_mount.yml

printf '...done.'
