#!/bin/bash


echo "Updating OS and installing dependencies."
sudo apt update -y
sudo apt upgrade -y
sudo apt purge -y libssl-dev
sudo apt install -y htop vim
sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev sqlite3 nodejs
sudo apt install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties


echo "Instaling ebenv"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
type rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install -l
rbenv install 2.3.8
rbenv global 2.3.8


echo "Version checks"
node  --version
rbenv --version
ruby --version
sqlite3 --version
