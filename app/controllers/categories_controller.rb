class CategoriesController < ApplicationController

    def index
        @categories = Category.all

        @campus = @categories[0]
        @campus_subcat_posting_count = Subcategory.count_per_subcat(@campus)

        @community = @categories[1]
        @community_subcat_posting_count = Subcategory.count_per_subcat(@community)

        @housing = @categories[2]
        @housing_subcat_posting_count = Subcategory.count_per_subcat(@housing)

        @h2f = @categories[3]
        @h2f_subcat_posting_count = Subcategory.count_per_subcat(@h2f)

        @free = @categories[4]
        @free_subcat_posting_count = Subcategory.count_per_subcat(@free)

        @jobs = @categories[5]
        @jobs_subcat_posting_count = Subcategory.count_per_subcat(@jobs)

        @sale = @categories[6]
        @sale_subcat_posting_count = Subcategory.count_per_subcat(@sale)

        @services = @categories[7]
        @services_subcat_posting_count = Subcategory.count_per_subcat(@services)

        @unboxing = @categories[8]
        @unboxing_subcat_posting_count = Subcategory.count_per_subcat(@unboxing)
    end

    def show
        @all_categories = Category.where('1=1')

        @category = Category.find(params[:id])

        @listings = Listing
            .order("created_at DESC")
            .where("ending_at > '#{Time.now.to_i}'")
            .where("media_file_name IS NOT NULL")
            .where("sold IS NULL")
            .where(category_id: params[:id])
    end
end
