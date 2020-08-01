Rails.application.configure do
    # Settings specified here will take precedence over those in config/application.rb.

    # In the development environment your application's code is reloaded on
    # every request. This slows down response time but is perfect for development
    # since you don't have to restart the web server when you make code changes.
    config.cache_classes = true

    # Eager load code on boot. This eager loads most of Rails and
    # your application in memory, allowing both threaded web servers
    # and those relying on copy on write to perform better.
    # Rake tasks automatically ignore this option for performance.
    config.eager_load = true

    # Show full error reports and disable caching.
    config.consider_all_requests_local       = false
    config.action_controller.perform_caching = true

    # Raises error for missing translations
    # config.action_view.raise_on_missing_translations = true

    # Print deprecation notices to the Rails logger.
    config.active_support.deprecation = :log

    # Raise an error on page load if there are pending migrations.
    config.active_record.migration_error = :page_load

    # Debug mode disables concatenation and preprocessing of assets.
    # This option may cause significant delays in view rendering with a large
    # number of complex assets.
    config.assets.debug = false

    # Asset digests allow you to set far-future HTTP expiration dates on all assets,
    # yet still be able to expire them through the digest params.
    config.assets.digest = true

    # Adds additional error checking when serving assets at runtime.
    # Checks for improperly declared sprockets dependencies.
    # Raises helpful error messages.
    config.assets.raise_runtime_errors = false

    # action_mailer for email configuration
    config.action_mailer.default_url_options = {
        :host => ENV['NAME'] + '.com'
    }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.smtp_settings = {
        address:                ENV['SES_SMTP_HOST'],
        port:                   ENV['SES_SMTP_PORT'],
        user_name:              ENV["SES_SMTP_USER"],
        password:               ENV["SES_SMTP_PASS"],
        authentication:         :login,
        enable_starttls_auto:   true
    }

    # config.web_console.whitelisted_ips = [
    #     # '10.0.0.0/24',
    #     # '70.125.10.0/24'
    # ]

    config.log_level = :warn
end
