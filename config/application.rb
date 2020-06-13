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
      # get instance region from meta-data server
      ENV['REGION'] = JSON.parse(`curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region'`.to_s)

      # reqiest EC2 tags from meta data and assign to env vars
      # Vars required: NAME, STAGE, RND
      tags = JSON.parse(`aws ec2 describe-tags \
        --region $(wget -qO- http://instance-data/latest/meta-data/placement/availability-zone | sed 's/.$//') \
        --filter "Name=resource-id, Values=$(wget -qO- http://instance-data/latest/meta-data/instance-id)" \
        --output=json`.to_s)
  
      tags['Tags'].each do |key, value|
        ENV[key.upcase}] = value

        # only want the applications name from the Name tag
        if key == 'Name'
          ENV[key.split("-")[0].upcase}] = value
        end
      end
    end

    # Load SSM client
    ssm_client = Aws::SSM::Client.new(region: ENV['REGION'])

    # TODO make this a loop with using an array w/ the keys we want to set.
    # RDS (SQL)
    ENV['RDS_DB_PASS'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-pass' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]
    ENV['RDS_DB_PORT'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-port' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]
    ENV['RDS_DB_SCHE'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-name' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]
    ENV['RDS_DB_USER'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-user' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]

    # SMTP
    ENV['SES_SMTP_FROM'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-from' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]
    ENV['SES_SMTP_HOST'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-host' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]
    ENV['SES_SMTP_PASS'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-pass' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]
    ENV['SES_SMTP_PORT'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-port' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]
    ENV['SES_SMTP_USER'] = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-user' + '-' + ENV['RND'], with_decryption: true).to_h[:parameter][:value]

    # Other required VARs
    ENV['AWS_S3_MEDIA_DISPLAY_BUCKET']  = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'media-display-s3-bucket' + '-' + ENV['RND'],         with_decryption: true).to_h[:parameter][:value]
    ENV['AWS_S3_MEDIA_SOURCE_BUCKET']   = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'media-source-s3-bucket' + '-' + ENV['RND'],          with_decryption: true).to_h[:parameter][:value]
    ENV['COOKIE_SECRET_KEY_BASE']       = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'web-app-cookie-secret-key-base' + '-' + ENV['RND'],  with_decryption: true).to_h[:parameter][:value]
    ENV['GEO_API_KEY']                  = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'geo-api-key' + '-' + ENV['RND'],                     with_decryption: true).to_h[:parameter][:value]
    ENV['GOOGLE_ANALYTICS']             = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'google-analytics' + '-' + ENV['RND'],                with_decryption: true).to_h[:parameter][:value]
    ENV['STRIPE_PUBLISH_KEY']           = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'stripe-publish-key' + '-' + ENV['RND'],              with_decryption: true).to_h[:parameter][:value]
    ENV['STRIPE_SECRET_KEY']            = ssm_client.get_parameter(name: ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'stripe-secret-key' + '-' + ENV['RND'],               with_decryption: true).to_h[:parameter][:value]
  end
end
