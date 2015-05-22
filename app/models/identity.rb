class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.from_omniauth(auth_hash)

    identity = Identity.find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    
    if identity.user_id == nil # If the OAuth Identity was created. Check to see if there's a user to associate with.

      user = User.find_by_email(auth_hash['info']['email']) if auth_hash['info']['email'] # User association found with email address match.
      user = User.new unless auth_hash['info']['email'] # User association not found, creating a new user.

      user.email = "change@me-#{auth_hash['uid']}-#{auth_hash['provider']}.com" unless auth_hash['info']['email'] # Creating temporary invalid e-mail for new user.
      user.first_name = auth_hash['info']['first_name']
      user.last_name = auth_hash['info']['last_name']
      user.password = SecureRandom.hex
      user.save!

      identity.user_id = user.id
      identity.token = auth_hash['credentials']['token']
      identity.secret = auth_hash['credentials']['secret']
      identity.save!

      return identity

    end

    if identity.user_id != nil # If identity exists, update the name information if the fields are nil.

      identity.user.first_name = auth_hash['info']['first_name'] if identity.user.first_name == nil
      identity.user.last_name = auth_hash['info']['last_name'] if identity.user.last_name == nil
      identity.user.save!

      return identity

    end

  end
end
