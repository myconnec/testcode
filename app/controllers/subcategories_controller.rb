class SubcategoriesController < ApplicationController

    def show
        @listings = Listing
            .where(subcategory_id: params[:id])
            .where("ending_at > '#{Time.now.to_i}'")
            .order("created_at DESC")
        @category = Category.find(params[:category_id])
        @subcategory = Subcategory.find(params[:id])
    end

    def find_by_category
        category = Category.find(params[:category_id])
        subcategories = category.subcategories.find_all
        render json: { subcategories: subcategories }
    end

    def chargable
        #Subcategory.find((params[:charable > 0))
        data = [5,10,15,20,25]
        render json: { data: data }
    end
end
