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
    # source https://stackoverflow.com/questions/5113248/devise-update-user-without-password/11676957#11676957
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  
    @user = User.find(params[:user][:id])
    @user.update_attributes(user_params)

    if !@user.save
      redirect_to "/users/edit", :flash => { :danger => @user.errors.full_messages.to_sentence }
      return
    end

    redirect_to "/users/edit", :flash => { :success => "Profile updated successfully." }
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

  def catch_not_found
    yield
  rescue
    redirect_to request.referer, :flash => { :danger => "Sorry, a problem has occured. Please let an admin know about this." }
  end
end
