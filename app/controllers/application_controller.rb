class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_categories

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:agreement, :username, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :bio, :avatar])
  end

  def get_categories
    @categories = Category.get_base_categories()
  end

end
