class Listing < ActiveRecord::Base
  acts_as_votable
  is_impressionable

  after_validation :geocode

  belongs_to :category
  belongs_to :subcategory
  belongs_to :user

  geocoded_by :full_address

  validates_presence_of :user_id
  validates_presence_of :price
  validates_presence_of :category_id
  validates_presence_of :subcategory_id
  validates_presence_of :title
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
  validates_presence_of :media
  validates_presence_of :description

  has_many :comments, dependent: :destroy
  # place the source media at this location
  # TODO: change based on ENV of lcl or other
  has_attached_file :media, :path => ":rails_root/../"+ENV["AWS_S3_MEDIA_SOURCE_BUCKET"]+"-"+ENV["APP_ENV"]+"/:class/:attachment/:id_partition/:style/:filename"

  # validates_attachment_size :media, :less_than => 800.megabytes
  validates_attachment_presence :media
  validates_attachment_content_type :media, :content_type => [
    "video/quicktime",
    "video/x-ms-wmv",
    "video/mp4",
    "video/3gpp",
    "audio/mp4",
    "video/x-flv",
    "video/x-msvideo",
    "video/webm"
  ]

  # this must be AFTER had_attached_file
  before_post_process :transliterate_file_name

  def full_address
    [city, state, zipcode].join(', ')
  end

  def self.search(params)
    listings = Listing.where("ending_at > '#{Time.now.to_i}'")
    listings = listings.where("title LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    listings = listings.where(category_id: params[:category].to_i) if params[:category].present?
    listings = listings.where(sub_category_id: params[:sub_category].to_i) if params[:sub_category].present?
    listings = listings.near(params[:location], 100) if params[:location].present?
    listings
  end

  private

  def transliterate_file_name
    extension = File.extname(media_file_name).gsub(/^\.+/, '')
    filename = media_file_name.gsub(/\.#{extension}$/, '')
    self.media.instance_write(:file_name, "#{transliterate(filename)}.mp4")
  end
end
