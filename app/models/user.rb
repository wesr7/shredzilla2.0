class User < ActiveRecord::Base

  TEMP_EMAIL_REGEX = /\Achange@me/
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  # ActiveRecord Relations
  has_many :identities

  # Using BCrypt
  has_secure_password

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
  
end
