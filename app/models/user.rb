# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  height          :string
#  weight          :float
#  email           :string
#  password_digest :string
#  username        :string
#  fitness         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  TEMP_EMAIL_REGEX = /\Achange@me/
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  # ActiveRecord Relations
  has_many :identities, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships, dependent: :destroy
  has_many :scores
  has_many :posts
  has_many :roles

  after_initialize :set_default_role, :if => :new_record?

  # Using BCrypt
  has_secure_password

  def set_default_role
    self.roles.new(role: "user")
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def admin?
    self.roles.where(role: "admin").exists?
  end

  def user?
    self.roles.where(role: "user").exists?
  end

end
