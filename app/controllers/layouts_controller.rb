class LayoutsController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @listings = Listing.active(params[:id], "category_id")
  end

end
