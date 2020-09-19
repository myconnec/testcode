class User < ActiveRecord::Base
  # :lockable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :listings, dependent: :destroy

  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "150x150>" },
    default_url: "no-photo-available.png"
  validates_uniqueness_of :username, :email
  validates_presence_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  #   validates_presence_of :password, presence: true, if: -> {password.nil?}
  validates :password,
    :presence => true,
    :if => lambda { !password.nil? },
    format: {
      with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/,
      message: "must include at least 1 lowercase character, 1 UPPERCASE character, 1 special character, and 1 digit."
    }

  validates :username, format: { with: /\A[a-zA-Z0-9\'\ \-]*\z/ }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
