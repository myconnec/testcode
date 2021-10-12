class Comment < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates_presence_of :listing_id
  validates_presence_of :user_id
  validates_presence_of :body

  def self.user_count(user_id)
    Listing.select("comments.id")
      .joins("LEFT JOIN comments ON listings.id = comments.listing_id")
      .where("listings.user_id = '#{user_id.to_i}'")
      .where("listings.ending_at > '#{Time.now.to_i}'")
      .where("listings.media_file_name IS NOT NULL")
      .where("listings.sold IS NULL")
      .count()
  end

end
