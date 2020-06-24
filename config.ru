# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
# source https://stackoverflow.com/questions/7236583/where-to-insert-rackdeflater-in-the-rack
use Rack::Deflater
run Rails.application
