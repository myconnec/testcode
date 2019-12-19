#!/bin/bash

echo 'init app setup via cloud init script'

# vars we need
APP_ENV: APP_ENV
APP_NAME: APP_NAME
AWS_REGION: AWS_REGION
SSH_KEY_ID: SSH_KEY_ID

database_address: database_address
database_password: database_password

media_profile_bucket_id: media_profile_bucket_id
version: master

local_group: ubuntu
local_user: ubuntu

# copy in prive ssh key for ENV
# IAM role allows for this access


echo "Host git-codecommit.*.amazonaws.com
    User ${SSH_KEY_ID}
    StrictHostKeyChecking no
    IdentityFile ~/.ssh/build_key" >> ~/.ssh/config

# Clone project
git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/connechub ./connechub
git checkout master 

# copy in .env for ENV
aws s3 cp s3://connechub-configs/dev/.env /home/ubuntu/connechub/.env

# update .env
sed -i "s/DB_HOST=\"mariadb\"/DB_HOST=\"{{ database_address }}\"/g" /home/ubuntu/connechub/.env
sed -i "s/DB_PASS=\"password\"/DB_PASS=\"{{ database_password }}\"/g" /home/ubuntu/connechub/.env

# copy in .passwd-s3fs to allow profile image mounting
# TODO migrate this to work the same way as video media
aws s3 cp s3://connechub-configs/dev/.passwd-s3fs /home/ubuntu/.passwd-s3fs
chmod 0600 /home/ubuntu/.passwd-s3fs
chown ubuntu:ubuntu /home/ubuntu/.passwd-s3fs

# allow users other than root to use fuse mounted directories
sed -i "s/#user_allow_other/user_allow_other/g" /etc/fuse.conf

# fuse mount s3 as directory
chmod 0755 -R /home/ubuntu/connechub/public/system
s3fs \
-d \
{{ media_profile_bucket_id }} \
/home/ubuntu/connechub/public/system \
-o endpoint=us-west-2 \
-o use_cache=/home/ubuntu \
-o multireq_max=5 \
-o passwd_file=/home/ubuntu/.passwd-s3fs  \
-o url=https://s3.us-west-2.amazonaws.com \
-o nonempty \
-o allow_other

# reset permissions for entire project dir
chown ubuntu:ubuntu -R ~/connechub

# change into proj dir, install gems
cd connechub
gem update --system
gem install bundler -v 1.7
bundle --binstubs
bundle config --global jobs 4
bundle install -V

# run any outstanding migrations
rake db:migrate

# start web server
sudo bundle exec puma --bind tcp://0.0.0.0:9293 --daemon
