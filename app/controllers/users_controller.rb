class UsersController < ApplicationController
  # around_filter :catch_not_found
  # before_filter :authenticate_user!
  
  def show
    @user = User.find_by username: params[:username]

    @listings = Listing
      .where(user_id: @user.id)
      .where("ending_at > '#{Time.now.to_i}'")
      .where("media_file_name IS NOT NULL")
      .order("created_at DESC")

    signer = Aws::S3::Presigner.new
    @listings.each do | listing |
      listing.presigned_media_url = signer.presigned_url(
        :get_object,
        bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
        key: (listing.media_file_name + '-00001.png')
      )
    end
  end

  def update_resource
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:current_password)
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    @user = User.find(params[:user][:id])
    @user.update(user_params)

    if !@user.save
      flash[:danger] = @user.errors.full_messages.to_sentence 
    end

    redirect_to "/users/edit"
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

  # def catch_not_found
  #   yield
  #   rescue
  #     if ENV['STAGE'].downcase != 'dev'
  #       redirect_to root_url, :flash => { :danger => "Sorry, a problem occured while loading your profile." }
  #     end
  # end
end
