class SearchController < ApplicationController

  def show
    @categories = Category.all
    @listings = Listing.search(params)
  end
end
