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
  # accepts_nested_attributes_for :memberships
  # Using BCrypt
  has_secure_password

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

end
