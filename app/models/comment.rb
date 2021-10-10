class Comment < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates_presence_of :listing_id
  validates_presence_of :user_id
  validates_presence_of :body
  
  def self.user_count(user_id)
    Listing.where("user_id = '#{user_id.to_i}'")
      .where("ending_at > '#{Time.now.to_i}'")
      .where("media_file_name IS NOT NULL")
      .where("sold IS NULL")
      .where("charge_amount <> 0")
      .count()
  end
end
