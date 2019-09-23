class UsersController < ApplicationController
  around_filter :catch_not_found

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
        key: listing.media_file_name
      )
    end
  end

  def catch_not_found
    yield
    rescue
      if ENV['APP_ENV'].downcase != 'dev'
        redirect_to root_url, :flash => { :danger => "Sorry, a problem occured while loading your profile." }
      end
  end
end
