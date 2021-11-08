class ApplicationController < ActionController::Base
  # pagination
  include Pagy::Backend

  # around_filter :catch_not_found
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_categories

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :agreement])
    devise_parameter_sanitizer.permit(:log_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :bio, :avatar, :password])
  end

  def get_categories
    @categories = Category.get_base_categories()
  end

  def catch_not_found
    yield
    # TODO maybe more specific errors here?
    rescue
      if ENV['RAILS_ENV'] == "production"
        redirect_to root_url, :flash => { :danger => "Sorry, an error occured. " }
      end
  end

end
