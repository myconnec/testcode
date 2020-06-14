#!/bin/bash
# source https://unix.stackexchange.com/questions/33557/using-an-already-established-ssh-channel
# source https://ldpreload.com/blog/ssh-control
# source https://unix.stackexchange.com/questions/50508/reusing-ssh-session-for-repeated-rsync-commands

# install sudo apt-get install -y inotify-tools

export SSH_KEY=$1 #"~/.ssh/aws-connechub-dev.pem"
export REMOTE_HOST=$2 #"18.144.166.69"
export DIR=$3 # app || config || db || public

if [[ ! -d $HOME/.ssh/ctl/ ]];then
    mkdir $HOME/.ssh/ctl/
fi

export CONTROL_PATH="$HOME/.ssh/ctl/%L-%r@%h:%p"

echo "Starting persistance SSH connection..."
ssh -i ${1} -nNf -o ControlMaster=yes -o ControlPath="$HOME/.ssh/ctl/%L-%r@%h:%p" ubuntu@${2}

echo "Stating sync, waiting ControlPath..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux distros
        echo "$OSTYPE detected..."
        while inotifywait -r -e modify,create,delete,move $DIR; do
            rsync -avz -e "ssh -i ${1} -o 'ControlPath=$HOME/.ssh/ctl/%L-%r@%h:%p'" $DIR ubuntu@${2}:/home/ubuntu/connechub
            echo "...synce completed."
        done
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        echo "$OSTYPE detected..."
        fswatch -o $DIR | xargs -n1 -I{} \
            rsync -avz -e "ssh -i ${1} -o 'ControlPath=$HOME/.ssh/ctl/%L-%r@%h:%p'" $DIR ubuntu@${2}:/home/ubuntu/connechub
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
