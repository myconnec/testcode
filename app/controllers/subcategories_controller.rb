class SubcategoriesController < ApplicationController

    def show
        @all_categories = Category.where('1=1')

        @category = Category.find(params[:category_id])

        @listings = Listing
            .where(subcategory_id: params[:id])
            .where("ending_at > '#{Time.now.to_i}'")
            .where("media_file_name IS NOT NULL")
            .order("created_at DESC")

        # TODO move this to a CNTL helper
        # media_file_name, add -00001.png
        signer = Aws::S3::Presigner.new
        @listings.each do | listing |
            listing.presigned_media_url = signer.presigned_url(
                :get_object,
                bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
                key: (listing.media_file_name[0..-5] + '.mp4-00001.png')
            )
        end

        @subcategory = Subcategory.find(params[:id])
    end

    def find_by_category
        render json: {
            subcategories: Subcategory.where(category_id: params[:category_id])
        }
    end
end
