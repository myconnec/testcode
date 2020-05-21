class UsersController < ApplicationController
  around_filter :catch_not_found
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
    
    if !@user.update(user_params)
      redirect_to action: 'user#edit', :flash => { :danger => @user.errors.full_messages.to_sentence  }
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
    )
  end

  def catch_not_found
    yield
    rescue
      if ENV['STAGE'].downcase != 'dev'
        redirect_to root_url, :flash => { :danger => "Sorry, a problem occured while loading your profile." }
      end
  end
end
