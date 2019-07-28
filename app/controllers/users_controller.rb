class UsersController < ApplicationController
    def show
      @user = User.find_by username: params[:username]
      
      @listings = Listing
        .where(user_id: @user.id)
        .where("ending_at > '#{Time.now.to_i}'")
        .order("created_at DESC")

        signer = Aws::S3::Presigner.new
        @listings.each do | listing |    
          if !listing.has_attribute?(:media_file_name)
            next
          end

          listing.presigned_media_url = signer.presigned_url(
            :get_object,
            bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
            key: listing.media_file_name
          )
        end
    end
end
