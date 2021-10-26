class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @listings = Listing.active(params[:id], "category_id")
  end

  def search
    @categories = Category.all
    @listings = Listing.search(params)
  end
end
