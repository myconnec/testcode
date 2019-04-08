#!/bin/bash +xe

# echo 'Giving the compute instance a chance to start up...'
# sleep 120;

echo 'Exporting Ansible settings...'
export ANSIBLE_NOCOWS=1
export ANSIBLE_DEBUG=0
export ANSIBLE_HOST_KEY_CHECKING=0
export ANSIBLE_STDOUT_CALLBACK=minimal

echo 'Executing Ansible playbook...'
ansible-playbook \
    --extra-vars='{
        "AWS_ACCESS_KEY": "'$(terraform output AWS_ACCESS_KEY)'",
        "AWS_SECRET_KEY": "'$(terraform output AWS_SECRET_KEY)'"
    }' \
    -i ''$(terraform output IP)',' \
    -u ubuntu \
    --private-key ~/.ssh/aws-connechub-test-dje2.pem \
    ./terraform/ec2_with_s3_bucket_mount/poc.yml

echo '...done.'
