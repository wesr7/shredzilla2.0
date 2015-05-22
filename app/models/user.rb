class User < ActiveRecord::Base
  # ActiveRecord Relations
  has_many :identities

  # Using BCrypt
  has_secure_password
end
