#!/bin/bash

echo 'Installing system tools...'
sudo apt-get update -y
sudo apt-get install -y inotify-tools mariadb-client

echo '...done.'
