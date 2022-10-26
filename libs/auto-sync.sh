#!/bin/bash

# example ./libs/auto-sync.sh "~/.ssh/aws-connechub-deb.pem" 1.2.3.4
# source https://unix.stackexchange.com/questions/33557/using-an-already-established-ssh-channel
# source https://ldpreload.com/blog/ssh-control
# source https://unix.stackexchange.com/questions/50508/reusing-ssh-session-for-repeated-rsync-commands

echo "INFO: Pre-flight setup..."

export REMOTE_PATH="/home/ubuntu/connechub"
export REMOTE_HOST="${2}" #"18.144.166.69"
export REMOTE_USER="ubuntu"
export SSH_KEY="${1}"     #"~/.ssh/aws-connechub-dev.pem"

rm -rf "$HOME/.ssh/connechub/" || true && mkdir -p "$HOME/.ssh/connechub/"

echo "INFO: Confirm tooling installed..."
if [[ "$OSTYPE" == "linux-gnu"* && ! $(which inotify-tools) ]]
then
    # Linux distros
    echo "$OSTYPE detected, installing inotify-tools..."
    sudo apt-get install -y inotify-tools
elif [[ "$OSTYPE" == "darwin"*  && ! $(which fswatch) ]]
then
    # Mac OSX
    echo "$OSTYPE detected, installing fswatch..."
    brew install -y fswatch
fi

echo "INFO: Starting persistance SSH connection..."
ssh -i "${1}" -nNf -o ControlMaster=yes -o ControlPath="$HOME/.ssh/connechub/%L-%r@%h:%p" "${REMOTE_USER}"@"${REMOTE_HOST}"

echo "INFO: Stating sync, waiting ControlPath..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux distros
    echo "INFO: Syncing from Linux host to target..."
    while inotifywait -r -e modify,create,delete,move .; do
        rsync \
            -avz \
            --exclude=".git" \
            --exclude="node_modules" \
            -e "ssh -i ${1} -o 'ControlPath=$HOME/.ssh/connechub/%L-%r@%h:%p'" \
            . \
            "${REMOTE_USER}"@"${REMOTE_HOST}":"${REMOTE_PATH}"
        echo "...synce completed."
    done
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo "INFO: Syncing from Mac host to target..."
    fswatch -o . | xargs \
        -n1 \
        -I{} \
        rsync -avz \
        --exclude=".git" \
        --exclude="node_modules" \
        -e "ssh -i ${1} -o 'ControlPath=$HOME/.ssh/connechub/%L-%r@%h:%p'" \
        . \
        "${REMOTE_USER}"@"${REMOTE_HOST}":"${REMOTE_PATH}"
    echo "INFO: Synce completed."
else
    echo "ERR: No supported OS detected, exiting."
    exit 1
fi

echo "INFO: ...done."
