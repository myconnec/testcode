#!/bin/bash
# source https://unix.stackexchange.com/questions/33557/using-an-already-established-ssh-channel
# source https://ldpreload.com/blog/ssh-control
# source https://unix.stackexchange.com/questions/50508/reusing-ssh-session-for-repeated-rsync-commands

# export SSH_KEY=$1 #"aws-connechub-dev-us-west-1-dje-armor.pem"
# export REMOTE_HOST=$2 #"18.144.166.69"

if [[ ! -d $HOME/.ssh/ctl/ ]];then
    mkdir $HOME/.ssh/ctl/
fi

export CONTROL_PATH="$HOME/.ssh/ctl/%L-%r@%h:%p"

echo "Starting persistance SSH connection..."
ssh -i ${1} -nNf -o ControlMaster=yes -o ControlPath="$HOME/.ssh/ctl/%L-%r@%h:%p" ubuntu@${2}

echo "To close connection execute the following:"
echo "ssh -O exit -o ControlPath=\"$HOME/.ssh/ctl/%L-%r@%h:%p\" ubuntu@${1}"

echo "Stating rsync, waiting ControlPath..."
while inotifywait -r -e modify,create,delete,move ../web_app/app; do
    rsync -avz -e "ssh -i ${1} -o 'ControlPath=$HOME/.ssh/ctl/%L-%r@%h:%p'" \
    ./app/ \
    ubuntu@${2}:/home/ubuntu/connechub/app
    echo "...done."
done
