require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Workspace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run 'rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # request instance meta data and assign to env varsI
    config.before_configuration do
      tmp = `curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document`.to_s
      meta_data = JSON.parse(tmp)
      meta_data.each do |key, value|
        ENV["AWS_META_DATA_#{key.upcase}"] = value 
      end
    end

    # Load SSM data need for app
    ssm_client = Aws::SSM::Client.new(region: ENV['AWS_META_DATA_REGION'])
    
    # Load values from SSM
    ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'] = ssm_client.get_parameter(name: '/media_display_s3_bucket', with_decryption: true).to_h[:parameter][:value]
    ENV['NAME'] = ssm_client.get_parameter(name: '/name', with_decryption: true).to_h[:parameter][:value]
    ENV['STAGE'] = ssm_client.get_parameter(name: '/stage', with_decryption: true).to_h[:parameter][:value]
    
    ENV['COOKIE_SECRET_KEY_BASE'] = ssm_client.get_parameter(name: '/web_app_cookie_secret_key_base', with_decryption: true).to_h[:parameter][:value]

    ENV['RDS_DB_HOST'] = ssm_client.get_parameter(name: '/rds_db_host', with_decryption: true).to_h[:parameter][:value]
    ENV['RDS_DB_PASS'] = ssm_client.get_parameter(name: '/rds_db_pass', with_decryption: true).to_h[:parameter][:value]
    ENV['RDS_DB_PORT'] = ssm_client.get_parameter(name: '/rds_db_port', with_decryption: true).to_h[:parameter][:value]
    ENV['RDS_DB_SCHE'] = ssm_client.get_parameter(name: '/rds_db_name', with_decryption: true).to_h[:parameter][:value]
    ENV['RDS_DB_USER'] = ssm_client.get_parameter(name: '/rds_db_user', with_decryption: true).to_h[:parameter][:value]

    ENV['SES_SMTP_FROM'] = ssm_client.get_parameter(name: '/smtp_from', with_decryption: true).to_h[:parameter][:value]
    ENV['SES_SMTP_HOST'] = ssm_client.get_parameter(name: '/smtp_host', with_decryption: true).to_h[:parameter][:value]
    ENV['SES_SMTP_PASS'] = ssm_client.get_parameter(name: '/smtp_pass', with_decryption: true).to_h[:parameter][:value]
    ENV['SES_SMTP_PORT'] = ssm_client.get_parameter(name: '/smtp_port', with_decryption: true).to_h[:parameter][:value]
    ENV['SES_SMTP_USER'] = ssm_client.get_parameter(name: '/smtp_user', with_decryption: true).to_h[:parameter][:value]

    ENV['STRIPE_SK'] = ssm_client.get_parameter(name: '/stripe_publish_key', with_decryption: true).to_h[:parameter][:value]
    ENV['STRIPE_PK'] = ssm_client.get_parameter(name: '/stripe_secret_key', with_decryption: true).to_h[:parameter][:value]
  end
end
