class User < ActiveRecord::Base
  # :lockable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :listings, dependent: :destroy

  validates_uniqueness_of :username, :email
  validates_presence_of :email
  # validates_presence_of :password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validate :password, :password_complexity
  validates :username, format: { with: /\A[a-zA-Z0-9\'\ \-]*\z/ }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "no-photo-available.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # def password_complexity
  #   return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,128}$/
  #   errors.add :password, "Complexity requirement not met. Length should be 8-128 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character."
  # end
end
