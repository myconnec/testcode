class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!

  def show
    @user = User.find_by username: params[:username]

    @listings = Listing
      .where(user_id: @user.id)
      .where("ending_at > '#{Time.now.to_i}'")
      .where("media_file_name IS NOT NULL")
      .order("created_at DESC")
  end

  def update
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user = User.find(params[:user][:id])
    @user.update(user_params)
    
    if !@user.save(user_params)
      redirect_to action: 'edit', :flash => { :danger => @user.errors.full_messages.to_sentence  }
    end

    redirect_to action: 'show', username: @user.username, :flash => { :success => 'Profile updated successfully.' }
  end

  private

  def user_params
    params.require(:user).permit(
      :avatar,
      :bio,
      :current_password,
      :email,
      :id,
      :password_confirmation,
      :password,
      :reset_password_token,
    )
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :bio, :avatar])
  end
end
