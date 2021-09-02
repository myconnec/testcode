class Category < ActiveRecord::Base
  has_many :listings
  has_many :subcategories

  def self.get_base_categories()
    Category.where("parent_id IS null")
  end
end
