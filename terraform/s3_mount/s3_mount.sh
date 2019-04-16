#!/bin/bash +xe

echo 'Giving the compute instance a chance to start up...'
#sleep 120;

echo 'Exporting Ansible settings...'
export ANSIBLE_NOCOWS=1
export ANSIBLE_DEBUG=0
export ANSIBLE_HOST_KEY_CHECKING=0
export ANSIBLE_STDOUT_CALLBACK=minimal

echo 'Executing Ansible playbook...'
ansible-playbook \
    -i ''$(terraform output EC2_web_host_ip)',' \
    -u ubuntu \
    --private-key ~/.ssh/aws-connechub-test-dje.pem \
    ./ansible/mount_s3.yml

echo '...done.'
