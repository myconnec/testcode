class SubcategoriesController < ApplicationController

    def show
        @listings = Listing
            .where(subcategory_id: params[:id])
            .where("ending_at > '#{Time.now.to_i}'")
            .where("media_file_name IS NOT NULL")
            .order("created_at DESC")

            # TODO move this into a CNTL helper
            # media_file_name, add -00001.png
            signer = Aws::S3::Presigner.new
            @listings.each do | listing |    
                listing.presigned_media_url = signer.presigned_url(
                  :get_object,
                  bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
                  key: (listing.media_file_name[0..-5] + '.mp4-00001.png')
                )
            end

        @category = Category.find(params[:category_id])
        @subcategory = Subcategory.find(params[:id])
    end

    def find_by_category
        category = Category.find(params[:category_id])
        subcategories = category.subcategories.find_all
        render json: { subcategories: subcategories }
    end
end
