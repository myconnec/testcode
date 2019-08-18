#! /bin/bash
sudo ubuntu
cd ~/connechub
./bin/rake db:migrate
pkill ruby
bundle exec puma --bind tcp://0.0.0.0:9293 --daemon