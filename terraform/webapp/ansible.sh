#!/bin/bash +xe

echo 'Giving the compute instance a chance to start up...'
<<<<<<< HEAD
#sleep 60;
=======
#sleep 120;
>>>>>>> Successfully mounted an S3 bucket. Now, can we do it w/o API credentials?

echo 'Exporting Ansible settings...'
export ANSIBLE_NOCOWS=1
export ANSIBLE_DEBUG=0
export ANSIBLE_HOST_KEY_CHECKING=0
export ANSIBLE_STDOUT_CALLBACK=minimal

echo 'Executing Ansible playbook...'
ansible-playbook \
    -i '3.19.44.242,' \
    -u ubuntu \
<<<<<<< HEAD
    --extra-vars='{"rd_dns": "'$(terraform output SQL_host_dns_addr)'"}' \
    --private-key ~/.ssh/aws-connechub-test-dje.pem \
    ./ansible/webapp.yml

=======
    --private-key ~/.ssh/aws-connechub-test-dje.pem \
    ./ansible/mount_s3.yml
>>>>>>> Successfully mounted an S3 bucket. Now, can we do it w/o API credentials?

echo '...done.'
