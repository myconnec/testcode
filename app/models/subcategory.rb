class Subcategory < ActiveRecord::Base
    belongs_to :category

    validates_presence_of :name
    validates_presence_of :category_id
    validates_presence_of :chargable

    # version <= 1.1.12
    def self.count_per_subcat(parent_cat)
        sale_subcat_posting_count = {}
        parent_cat.subcategories.each do |subcategory|
            listings = Listing.where("subcategory_id = #{subcategory.id}")
            listings = listings.where("ending_at > '#{Time.now.to_i}'")
            listings = listings.where("media_file_name IS NOT NULL")
            listings = listings.where("sold IS NULL")

            sale_subcat_posting_count.merge!({subcategory.id => listings.count})
        end
        sale_subcat_posting_count
    end

    # version >= 1.1.13
    # Use the request cat id to limit the sub_cat listing id range
    def self.get_subcat_listing_counts(sub_category)
        return 0
        # subcat_listing_counts = Category.includes(:subcategory_id).map { |c| c.category_id }
    end
end
