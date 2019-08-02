#!/bin/bash +xe
cd /ubuntu/connechub
bundle exec puma --bind tcp://0.0.0.0:9293 --daemon
