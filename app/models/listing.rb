class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  acts_as_votable
  is_impressionable
  
  
  validates_presence_of :user_id
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :price
 

    
  geocoded_by :full_address
  after_validation :geocode
  
  has_many :comments, dependent: :destroy
  has_attached_file :pin_image
  validates_attachment_size :pin_image, :less_than => 800.megabytes
  validates_attachment_presence :pin_image
  validates_attachment_content_type :pin_image, :content_type => ["video/quicktime", "video/x-ms-wmv", "video/mp4", "video/3gpp", "audio/mp4", "video/x-flv", "video/x-msvideo", "video/webm"]

 
  def full_address
    [city, state, zipcode].join(', ')
  end
  
  def self.search(params)
    listings = Listing.where(category_id: params[:category].to_i)
    listings = listings.where("title LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    listings = listings.near(params[:location], 100) if params[:location].present?
    listings
  end
end