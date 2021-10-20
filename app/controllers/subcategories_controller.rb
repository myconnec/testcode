class SubcategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @listings = Listing.active(params[:id], "subcategory_id")
    @subcategory = Subcategory.find(params[:id])
  end

  def find_by_category
    render json: {
      subcategories: Subcategory.where(category_id: params[:category_id]),
    }
  end
end
