# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string           not null
#  uid        :string           not null
#  token      :string
#  secret     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Identity < ActiveRecord::Base

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.from_omniauth(auth_hash)

    identity = Identity.find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])

    if identity.user_id == nil # If the OAuth Identity was created. Check to see if there's a user to associate with.

      user = User.find_by_email(auth_hash['info']['email']) if auth_hash['info']['email'] # If an e-mail was returned, try and find the user associated with it.
      user = User.new if !user # If an associated user wasn't returned, create a new user.

      # Creates a temporary e-mail if user logs in with Twitter. Assigns e-mail if one is returned with the auth_hash.
      user.email = "change@me-#{auth_hash['uid']}-#{auth_hash['provider']}.com" unless auth_hash['info']['email']
      user.email = auth_hash['info']['email'] if auth_hash['info']['email']

      # Assigning first name. If user is using Twitter, it will assign 'name' from auth_hash to first_name.
      user.first_name = auth_hash['info']['first_name'] if auth_hash['info']['first_name']
      user.first_name = auth_hash['info']['name'] unless auth_hash['info']['first_name']

      user.last_name = auth_hash['info']['last_name']
      user.password = SecureRandom.hex # Since user is logging in with OAuth, assign a random password to pass validation.
      user.save!

      identity.user_id = user.id # Associate the new user's id to the identity.
      identity.token = auth_hash['credentials']['token'] # Store the user's token just in case we need it in the future.
      identity.secret = auth_hash['credentials']['secret'] # Store the user's secret just in case we need it in the future.
      identity.save!

      return identity

    end

    if identity.user_id != nil # If identity exists, update the name information if the fields are nil.

      identity.user.first_name = auth_hash['info']['first_name'] if identity.user.first_name == nil && auth_hash['info']['first_name']
      identity.user.first_name = auth_hash['info']['name'] if identity.user.first_name == nil && !auth_hash['info']['first_name']
      identity.user.last_name = auth_hash['info']['last_name'] if identity.user.last_name == nil
      identity.user.save! unless auth_hash['provider'] == 'twitter' # Temporary until I implement e-mail verification later.

      return identity

    end

  end
end
