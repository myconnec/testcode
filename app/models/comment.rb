class Comment < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates_presence_of :listing_id
  validates_presence_of :user_id
  validates_presence_of :body
  
end
