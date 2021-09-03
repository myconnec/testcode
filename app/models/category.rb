class Category < ActiveRecord::Base
  has_many :listings
  has_many :subcategories

  def self.get_base_categories()
    Category.where("parent_id IS null")
  end

    def listing_count(category_id)
    Listing
      .where("category_id = '#{category_id}'")
      .where("ending_at > '#{Time.now.to_i}'")
      .count()
  end
end
