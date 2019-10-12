class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :listings, dependent: :destroy

  validates_uniqueness_of :username

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "no-photo-available.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
