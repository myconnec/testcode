#!/bin/bash -e
# Source: https://gorails.com/setup/ubuntu/18.04#ruby

# Install system dependencies
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

# Install Ruby
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.6.1
rbenv global 2.6.1
gem install bundler
gem update --system

# Install Rails
gem install rails -v 5.2.2
rbenv rehash

# Versions
bundler --version
rails --version
rake --version
ruby --version
sqlite3 --version

# Create application
rails new app
cd app
bundle update

gem uninstall sqlite3 -v 1.4.0
sed -i -e "s/gem 'sqlite3'/gem 'sqlite3' , '~> 1.3.6'/g" Gemfile
bundle update

rake db:create
rails server
