class Subcategory < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :name
  validates_presence_of :category_id
  validates_presence_of :chargable

  def listing_count(category_id, subcategory_id)
    Listing
      .where("category_id = '#{category_id}'")
      .where("ending_at > '#{Time.now.to_i}'")
      .where("subcategory_id = '#{subcategory_id}'")
      .count()
  end
end
