require File.expand_path('../boot', __FILE__)

require 'json'
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

    # Enable Skylight APM for non-production ENVs
    config.skylight.environments += ["development"]

    # request tags from meta data and assign to env vars. Vars required: NAME, REGION, RND, and STAGE
    instance_ident = `curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document`
    instance_id    = `curl --silent http://instance-data/latest/meta-data/instance-id`
    ENV['REGION'] = JSON.parse(instance_ident)['region']

    # request instance meta data and assign to env varsI
    config.before_configuration do
      tags = `aws ec2 describe-tags --filter 'Name=resource-id, Values=#{instance_id}' --output=json --region #{ENV['REGION']}`
      tags = JSON.parse(tags)

      tags['Tags'].each do |tag|
        ENV[tag['Key'].upcase] = tag['Value']
      end
    end

    # If unable to load SSM parameters, terminate instance
    # Load Ruby SSM client
    ssm_client = Aws::SSM::Client.new(region: ENV['REGION'])

    begin
      # Load run time values
      # RDS (SQL)
      ENV['RDS_DB_HOST']  = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-host' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['RDS_DB_PASS']  = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-pass' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['RDS_DB_PORT']  = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-port' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['RDS_DB_SCHE']  = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-name' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['RDS_DB_USER']  = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'rds-db-user' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]

      # AWS - SMTP (Email)
      ENV['SES_SMTP_FROM'] = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-from' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['SES_SMTP_HOST'] = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-host' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['SES_SMTP_PASS'] = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-pass' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['SES_SMTP_PORT'] = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-port' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['SES_SMTP_USER'] = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'smtp-user' + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]

      # AWS - S3 Buckets
      ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'] = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'media-display-s3-bucket'        + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['AWS_S3_MEDIA_SOURCE_BUCKET']  = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'media-source-s3-bucket'         + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]

      # Geocodio
      ENV['GEO_API_KEY']                 = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'geo-api-key'                    + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]

      # Google Based Services
      ENV['GOOGLE_ANALYTICS']            = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'google-analytics'               + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]

      # Stripe
      ENV['STRIPE_PUBLISH_KEY']          = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'stripe-publish-key'             + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['STRIPE_SECRET_KEY']           = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'stripe-secret-key'              + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]

      # Skylight
      ENV['SKYLIGHT_AUTHENTICATION']     = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'skylight-apm'                   + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]

      # Web App Vars
      ENV['NAME']                        = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'name'                           + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['WEB_APP_COOKIE_SECRET_BASE']  = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'web-app-cookie-secret-base'     + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]
      ENV['WEB_APP_VERSION']             = ssm_client.get_parameter(name: (ENV['NAME'] + '-' + ENV['STAGE'] + '-' + 'web-app-version'                + '-' + ENV['RND']), with_decryption: true).to_h[:parameter][:value]

      # Create the FQDN to be used in logic
      ENV['BASE_URL'] = ('https://' + (ENV['STAGE'] == 'prd' ? 'www' : ENV['STAGE']) + '.' + ENV['NAME'] + '.com').downcase
    rescue
      # ...or terminate the insance
      `aws ec2 terminate-instances --instance-ids=#{instance_id} --region=#{ENV['REGION']}`
    end
  end
end
