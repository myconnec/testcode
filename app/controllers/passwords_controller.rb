# source: https://github.com/heartcombo/devise/wiki/How-To:-Use-Recaptcha-with-Devise
class PasswordsController < Devise::PasswordsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new
        respond_with_navigational(resource) { render :new }
    end
  end
end
