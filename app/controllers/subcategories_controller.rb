class SubcategoriesController < ApplicationController

    def show
        @all_categories = Category.where('1=1')

        @category = Category.find(params[:category_id])

        @listings = Listing
            .where("ending_at > '#{Time.now.to_i}'")
            .where("media_file_name IS NOT NULL")
            .where("sold IS NULL")
            .where(subcategory_id: params[:id])
            .order("created_at DESC")

        @subcategory = Subcategory.find(params[:id])
    end

    def find_by_category
        render json: {
            subcategories: Subcategory.where(category_id: params[:category_id])
        }
    end
end
