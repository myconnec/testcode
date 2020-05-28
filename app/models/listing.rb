class Listing < ActiveRecord::Base
  acts_as_votable
  is_impressionable

  after_validation :geocode

  belongs_to :category
  belongs_to :condition
  belongs_to :subcategory
  belongs_to :user

  geocoded_by :full_address

  validates_presence_of :category_id
  validates_presence_of :city
  #validates_presence_of :condition_id # not required
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :state
  validates_presence_of :subcategory_id
  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :zipcode

  has_many :comments, dependent: :destroy

  def full_address
    [city, state, zipcode].join(', ')
  end

  def self.active(subcategory_id)
    Listing.where("ending_at > '#{Time.now.to_i}'")
      .where("media_file_name IS NOT NULL")
      .where("sold IS NULL")
      .where(subcategory_id: subcategory_id)
      .order("created_at DESC")
  end

  def self.search(params)
    listings = Listing.where("ending_at > '#{Time.now.to_i}'")
    listings = listings.where("sold IS NULL")
    listings = listings.where("title LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    listings = listings.where("media_file_name IS NOT NULL")
    listings = listings.where(category_id: params[:category].to_i) if params[:category].present?
    listings = listings.where(sub_category_id: params[:sub_category].to_i) if params[:sub_category].present?
    listings = listings.near(params[:location], 100) if params[:location].present?
    listings = listings.order('created_at DESC')
    listings
  end
end
