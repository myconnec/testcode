class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])


    # paginated listings
    @pagy, @listings = pagy(Listing.active(params[:id], "category_id"))
  end
end
