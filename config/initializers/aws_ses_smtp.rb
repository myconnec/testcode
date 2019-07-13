# AWS SES smtp email for RoR action_mailer
Rails.application.config.action_mailer.default_url_options = {
    :host => ENV['APP_HOST']
}
Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.perform_deliveries = true
Rails.application.config.action_mailer.raise_delivery_errors = true
Rails.application.config.action_mailer.smtp_settings = {
    address:      ENV['SES_SMTP_ADDRESS'],
    port:             ENV['SES_SMTP_PORT'],
    user_name:ENV["SES_SMTP_USERNAME"],
    password:   ENV["SES_SMTP_PASSWORD"],
    authentication:   :login,
    enable_starttls_auto: true
}
