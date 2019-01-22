class CategoriesController < ApplicationController

    def index
        @categories = Category.all

        @campus = @categories[0]
        @community = @categories[1]
        @housing = @categories[2]
        @h2f = @categories[3]
        @free = @categories[4]
        @jobs = @categories[5]
        @sale = @categories[6]
        @services = @categories[7]
        @unboxing = @categories[8]
    end 
    
    def show
    @listings = Listing.where(category_id: params[:id]).order("created_at DESC")
    @category = Category.find(params[:id])
    end


end