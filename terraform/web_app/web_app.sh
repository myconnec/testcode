#!/bin/bash +xe

printf "Giving the compute and database instances a chance to start up...\n"
#sleep 120;

# vars: ${var.APP_ENV} ${var.APP_NAME} ${var.AWS_REGION} ${var.media_display_bucket_id} ${var.media_source_bucket_id} $(terraform output database_address) ${var.AWS_PEM_KEY_PAIR}
printf "Incominig variables: $1 $2 $3 $4 $5 $6 $7 $8\n"

# accept SSH host key
export ANSIBLE_HOST_KEY_CHECKING=false

printf 'Executing Ansible playbook...'
ansible-playbook \
    -i ''$1',' \
    -u ubuntu \
    --extra-vars='{
        "APP_ENV": "'$2'",
        "APP_NAME": "'$3'",
        "AWS_REGION": "'$4'",
        "media_display_bucket_id": "'$5'",
        "media_source_bucket_id": "'$6'",
        "database_address": "'$7'"
    }' \
    --private-key ~/.ssh/$8.pem \
    ./terraform/web_app/web_app.yml

printf '...done.\n\n'
