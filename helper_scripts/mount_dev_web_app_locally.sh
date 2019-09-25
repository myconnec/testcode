#!/bin/bash -xe
# source https://www.linode.com/docs/networking/ssh/using-sshfs-on-linux/

echo "Update and upgrade your system to latest..."
#apt-get update && apt-get upgrade

echo "Install sshfs package..."
# apt-get install sshfs
group_exist = $(cat /etc/group | grep 'fuse')

# does fuse group exist?
if [ group_exist == 0 ]; then
    # OSX: sudo dscl . -create /groups/fuse
    sudo groupadd fuse
fi
sudo usermod -a -G fuse $(whoami)

if [! -d ./remote_app  ]; then
    mkdir ./remote_app
fi

echo "Mounting remote dir locally..."
sshfs ubuntu@$(terraform output aws_instance_web_app_dns):/home/ubuntu/$(terraform output APP_NAME)/app ./remote_app -o IdentityFile=~/.ssh/$(terraform output AWS_PEM_KEY_PAIR).pem
