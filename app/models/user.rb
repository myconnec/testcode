class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :listings, dependent: :destroy

  validates_uniqueness_of :username, :email
  validates_presence_of :email
  # validates_presence_of :password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, format: { with: /\A[a-zA-Z0-9\'\ \-]*\z/ }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "no-photo-available.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
