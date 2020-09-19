class ApplicationController < ActionController::Base
  # Prevent errors sending to the end user
  # around_filter :catch_not_found

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def catch_not_found
  yield
  rescue
    redirect_to root_url, :flash => { :danger => "Sorry, a problem occured while loading your profile." }
  end

end
