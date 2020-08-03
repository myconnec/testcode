class SubcategoriesController < ApplicationController

    def show
        @category = Category.find(params[:category_id])
        @listings = Listing.active(params[:id], 'subcategory_id')
        @subcategory = Subcategory.find(params[:id])

        # TODO Extracr into a CNTL helper
        @categories = Category.all
        subcat_listing_count = categories.map { |c| c.count }
    end

    def find_by_category
        render json: {
            subcategories: Subcategory.where(category_id: params[:category_id])
        }
    end
end
