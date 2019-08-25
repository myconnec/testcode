class UsersController < ApplicationController
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
end
