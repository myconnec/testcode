# source https://stackoverflow.com/questions/3546289/override-devise-registrations-controller#3553561
# source https://github.com/ambethia/recaptcha
# source https://stackoverflow.com/questions/51432711/ruby-on-rails-devise-recaptcha-registrations-sessions-fail#51547192

class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        resource.validate # Look for any other validation errors besides reCAPTCHA
        set_minimum_password_length
        respond_with_navigational(resource) { render :new }
      end 
    end
end