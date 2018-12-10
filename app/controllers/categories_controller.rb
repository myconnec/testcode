class CategoriesController < ApplicationController

    def index
        @categories = Category.all
        @campus = @categories[0]
        @community = @categories[1]
        @housing = @categories[2]
        @h2f = @categories[3]
        @free = @categories[4]
        @jobs = @categories[5]
        @talent = @categories[6]
        @personals = @categories[7]
        @sale = @categories[8]
        @services = @categories[9]
        @unboxing = @categories[10]
    end 
    
    def show
    @listings = Listing.where(category_id: params[:id]).order("created_at DESC")
    @category = Category.find(params[:id])
    end


end