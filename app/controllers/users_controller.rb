class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find_by username: params[:username]

    @user_listings_user_active = Listing.user_active(@user.id)
    @user_listing_header_free  = Listing.user_free(@user.id)
    @user_listing_header_paid  = Listing.user_paid(@user.id)
    @user_listing_header_cmmt  = Comment.user_count(@user.id)
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
      flash[:danger] = @user.errors.full_messages.to_sentence
    else
      flash[:success] = "Profile updated successfully."
    end

    redirect_to(:back)
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
end
