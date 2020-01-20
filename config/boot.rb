ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

ENV['META_DATA'] = `curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document`

require 'bundler/setup'
