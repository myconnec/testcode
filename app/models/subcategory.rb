class Subcategory < ActiveRecord::Base
    belongs_to :category

    def self.count_per_subcat(id)
        count = 1
        count = Listing.where("subcategory_id = #{id}").count
        count
    end
end