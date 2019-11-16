class Subcategory < ActiveRecord::Base
    belongs_to :category

    def self.count_per_subcat(parent_cat)
        sale_subcat_posting_count = {}
        parent_cat.subcategories.each do |subcategory|
            listings = Listing.where("subcategory_id = #{subcategory.id}")
            listings = listings.where("ending_at > '#{Time.now.to_i}'")
            listings = listings.where("media_file_name IS NOT NULL")

            sale_subcat_posting_count.merge!({subcategory.id => listings.count})
        end
        sale_subcat_posting_count
    end
end
