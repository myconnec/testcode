class CategoriesController < ApplicationController

    def index
        # get all top level categories
        @categories = Category.all

        # Most Recent 15 Listings for cat#index VS
        @listings = Listing.most_recent
    end

    def show
        @categories = Category.all
        @category = Category.find(params[:id])
        @listings = Listing.active(params[:id], 'category_id')
    end
end
