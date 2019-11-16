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
        # @sale_subcat_posting_count = [0,2,4,8,6,5,4,8,2,6,0,2,4,8,6,5,4,8,2,6,0,2,4,8,6,5,4,8,2,6,0,2,4,8,6,5,4,8,2,6,0,2,4,8,6,5,4,8,2,6]
        # @sale_subcat_posting_count = {
        #     167 => 1,
        #     168 => 0,
        #     169 => 0,
        #     170 => 0,
        #     171 => 0,
        #     172 => 0,
        #     173 => 0,
        #     174 => 0,
        #     175 => 5,
        #     176 => 0,
        #     177 => 0,
        #     178 => 0,
        #     179 => 0,
        #     180 => 0,
        #     181 => 0,
        #     182 => 0,
        #     183 => 10,
        #     184 => 0,
        #     185 => 0
        # }

        @sale_subcat_posting_count = {}
        @sale.subcategories.each do |subcategory|
            @sale_subcat_posting_count.merge!({subcategory.id => Subcategory.count_per_subcat(subcategory.id)})
        end

        @services = @categories[7]
        @unboxing = @categories[8]
    end

    def show
        @listings = Listing.where(category_id: params[:id])
            .where("ending_at > '#{Time.now.to_i}'")
            .where("media_file_name IS NOT NULL")
            .order("created_at DESC")

        # media_file_name, remove extension, add -00001.png
        signer = Aws::S3::Presigner.new
        @listings.each do | listing |    
            listing.presigned_media_url = signer.presigned_url(
              :get_object,
              bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
              key: (listing.media_file_name[0..-5] + '-00001.png')
            )
        end

        @category = Category.find(params[:id])
    end
end
