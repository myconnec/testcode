#!/bin/bash

echo ‘Update Homebrew’
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
echo ‘Update Homebrew’
brew update
echo ‘Install RVM’
curl -sSL https://get.rvm.io | bash -s stable
echo ‘Install Ruby 2.3.7’
rvm install "ruby-2.3.7”
echo ‘Use Ruby 2.3.7’
rvm use 2.3.7
echo ‘Install app Gems’
bundle install --verbose
echo ‘Run RoR migrations’
rake db:migrate --verbose
echo’ Start RoR Web Server’
rails server -d
echo 'Server running on http://localhost:3000'
