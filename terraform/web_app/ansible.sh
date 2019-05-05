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
        "app_env": "'$(terraform output APP_ENV)'",
        "database_endpoint_dns": "'$(terraform output database_endpoint_dns)'",
    }' \
    --private-key ~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem \
    ./terraform/web_app/web_app.yml

echo '...done.'
