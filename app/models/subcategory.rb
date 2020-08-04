class Subcategory < ActiveRecord::Base
    belongs_to :category

    validates_presence_of :name
    validates_presence_of :category_id
    validates_presence_of :chargable

    # version >= 1.1.13
    # Use the request cat id to limit the sub_cat listing id range
    def self.get_subcat_listing_counts(sub_category)
        return 0
        # subcat_listing_counts = Category.includes(:subcategory_id).map { |c| c.category_id }
    end
end
