#!/bin/bash


echo "Updating OS and installing dependencies."
sudo apt update -y
sudo apt upgrade -y
sudo apt purge -y libssl-dev
sudo apt install -y htop vim
sudo apt install -y autoconf bison build-essential libyaml-dev  zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev sqlite3 nodejs

echo "Must use SSL 1.0-dev with Ruby 2.3.x"
sudo apt install -y libssl1.0-dev libreadline-dev

echo "Instaling rbenv"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
type rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install -l
rbenv install -f 2.3.8
rbenv global 2.3.8


echo "Version checks"
node  --version
rbenv --version
ruby --version
sqlite3 --version
