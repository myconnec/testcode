#!/bin/bash

echo 'Run these commands on the remote host...'

export RACK_ENV=development
export RAILS_ENV=development

echo '...killing old puma'
sudo pkill -9 -f puma

echo '...removing ./tmp/cache/...'
sudo rm -rf ./tmp/cache/

echo '...restart Puma...'
bundle exec puma --bind tcp://0.0.0.0:9293 --environment ${RAILS_ENV}

echo '...done.'
