class User < ActiveRecord::Base
  # :lockable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :listings, dependent: :destroy

  validates_acceptance_of :tos_agreement, :allow_nil => false, :accept => true, :on => :create
  validates_uniqueness_of :username, :email
  validates_presence_of :email
  # validates_presence_of :password
  validate :password, :password_complexity

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, format: { with: /\A[a-zA-Z0-9\'\ \-]*\z/ }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "no-photo-available.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def password_complexity
    # source https://stackoverflow.com/questions/13759091/does-ruby-regular-expression-have-a-not-match-operator-like-in-perl#13759167
    # source https://stackoverflow.com/questions/19478173/validating-presence-of-has-secure-password-only-when-password-is-in-params
    if !password.nil? and password !~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~!@#$%^&*()_+-=]).{8,128}$/
      errors.add :password, "Complexity requirement not met. Length should be 8-128 characters and include: 1 uppercase (A-Z), 1 lowercase (a-z), 1 digit (0-9) and 1 special character (~!@#$%^&*()_+`-=)."
    end
  end
end
