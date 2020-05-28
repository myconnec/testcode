class Category < ActiveRecord::Base
  has_many :listings
  has_many :subcategories

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

  def self.menu_items
    Category.where("
      SELECT categories.name, categories.id, subcategories.name, subcategories.id
      FROM categories
      JOIN subcategories ON subcategories.category_id = categories.id
      ;")
  end

end
