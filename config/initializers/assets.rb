# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '2.0.0'

Rails.configuration.assets.precompile += %w[serviceworker.js manifest.json ]
