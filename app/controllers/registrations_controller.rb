# source https://stackoverflow.com/questions/3546289/override-devise-registrations-controller#3553561
# source https://github.com/ambethia/recaptcha
# source https://stackoverflow.com/questions/51432711/ruby-on-rails-devise-recaptcha-registrations-sessions-fail#51547192

class RegistrationsController < Devise::RegistrationsController
  def create
    if !verify_recaptcha
      flash.delete :recaptcha_error
      build_resource(sign_up_params)
      resource.valid?
      resource.errors.add(:base, "There was an error with the recaptcha code below. Please re-enter the code.")
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render :new }
    else
      flash.delete :recaptcha_error
      super
    end
  end

end