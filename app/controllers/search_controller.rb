class SearchController < ApplicationController
  def show
    @categories = Category.all
    @listings = Listing.search(params)
    
    # paginated listings
    # @pagy, @listing = pagy(Listing.active(params[:id], "listing_id"))
  end
end
