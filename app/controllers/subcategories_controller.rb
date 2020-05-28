class SubcategoriesController < ApplicationController

    def show
        @category = Category.find(params[:category_id])
        @category_menu_items = Category.menu_items()
        @listings = Listing.active(params[:id])
        @subcategory = Subcategory.find(params[:id])
    end

    def find_by_category
        render json: {
            subcategories: Subcategory.where(category_id: params[:category_id])
        }
    end
end
