#!/bin/bash
# source https://unix.stackexchange.com/questions/33557/using-an-already-established-ssh-channel
# source https://ldpreload.com/blog/ssh-control
# source https://unix.stackexchange.com/questions/50508/reusing-ssh-session-for-repeated-rsync-commands

# exmple single use:
# rsync \
#     -avz \
#     --exclude=".git" \
#     --exclude="node_modules" \
#     -e "ssh -vvv -i ~/.ssh/aws-connechub-dev.pem -o 'ControlPath=$HOME/.ssh/connechub/%L-%r@%h:%p'" . ubuntu@35.162.85.43:/home/ubuntu/connechub/app

echo "INFO: Pre-flight setup..."
export CONTROL_PATH="$HOME/.ssh/connechub/%L-%r@%h:%p"
export REMOTE_HOST=$2 #"18.144.166.69"
export SSH_KEY=$1     #"~/.ssh/aws-connechub-dev.pem"

if [[ ! -d "$HOME/.ssh/connechub/" ]]; then
    mkdir "$HOME/.ssh/connechub/"
fi

echo "INFO: Confirm tooling installed..."
if [[ "$OSTYPE" == "linux-gnu"* && ! $(which inotify-tools) ]]
then
    # Linux distros
    echo "$OSTYPE detected, installing inotify-tools..."
    sudo apt-get install -y inotify-tools
elif [[ "$OSTYPE" == "darwin"*  && ! $(which fswatch) ]]
then
    # Mac OSX
    echo "$OSTYPE detected, installing inotify-tools..."
    brew install -y fswatch
fi

echo "Starting persistance SSH connection..."
ssh -i "${1}" -nNf -o ControlMaster=yes -o ControlPath="$HOME/.ssh/connechub/%L-%r@%h:%p" ubuntu@${2}

echo "Stating sync, waiting ControlPath..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux distros
    echo "$OSTYPE detected..."
    while inotifywait -r -e modify,create,delete,move .; do
        rsync \
            -avz \
            --exclude=".git" \
            --exclude="node_modules" \
            -e "ssh -i ${1} -o 'ControlPath=$HOME/.ssh/connechub/%L-%r@%h:%p'" . ubuntu@"${2}":/home/ubuntu/connechub
        echo "...synce completed."
    done
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo "$OSTYPE detected..."
    fswatch -o . | xargs \
        -n1 \
        -I{} \
        rsync -avz \
        --exclude=".git" \
        --exclude="node_modules" \
        -e "ssh -i ${1} -o 'ControlPath=$HOME/.ssh/connechub/%L-%r@%h:%p'" . ubuntu@"${2}":/home/ubuntu/connechub
    echo "...synce completed."
elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    echo "$OSTYPE detected..."
elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    echo "$OSTYPE detected..."
elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
    echo "$OSTYPE detected..."
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    # ...
    echo "$OSTYPE detected..."
else
    # Unknown.
    echo "$OSTYPE detected..."
fi

echo "...done."
