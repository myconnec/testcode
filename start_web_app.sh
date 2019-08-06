#!/bin/bash +xe
cd ~/
git pull origin master
./bin/rake db:migrate
pkill puma
bundle exec puma --bind tcp://0.0.0.0:9293 --daemon