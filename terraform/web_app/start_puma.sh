#!/bin/bash +xe
# typically located ~ /home/ubuntu
cd ~/connechub
bundle exec puma --bind tcp://0.0.0.0:9293 --daemon
