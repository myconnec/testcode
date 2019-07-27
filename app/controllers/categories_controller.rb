class CategoriesController < ApplicationController

    def index
        @categories = Category.all

        @campus = @categories[0]
        @community = @categories[1]
        @housing = @categories[2]
        @h2f = @categories[3]
        @free = @categories[4]
        @jobs = @categories[5]
        @sale = @categories[6]
        @services = @categories[7]
        @unboxing = @categories[8]
    end

    def show
        @listings = Listing.where(category_id: params[:id])
            .where("ending_at > '#{Time.now.to_i}'")
            .order("created_at DESC")

        @listings.each do | listing |
            signer = Aws::S3::Presigner.new
            listing.presigned_media_url = signer.presigned_url(
              :get_object,
              bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
              key: listing.media_file_name
            )
        end

        @category = Category.find(params[:id])
    end
end
