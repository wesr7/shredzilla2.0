class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.from_omniauth(auth_hash)
    identity = Identity.find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    
    # If a new identity was created.
    if identity.user_id == nil
      if auth_hash['info']['email']
        user = User.find_by_email(auth_hash['info']['email'])
        user.first_name = auth_hash['info']['first_name']
        user.last_name = auth_hash['info']['last_name']
        user.save!
        identity.token = auth_hash['credentials']['token']
        identity.secret = auth_hash['credentials']['secret']
        identity.user_id = user.id
        identity.save!
        identity
      else
        user = User.new
        user.first_name = auth_hash['info']['first_name']
        user.last_name = auth_hash['info']['last_name']
        user.email = "change@me-#{auth_hash['uid']}-#{auth_hash['provider']}.com"
        user.save!
        identity.token = auth_hash['credentials']['token']
        identity.secret = auth_hash['credentials']['secret']
        identity.user_id = user.id
        identity.save!
        identity        
      end
    else
      identity.user.first_name = auth_hash['info']['first_name']
      identity.user.last_name = auth_hash['info']['last_name']
      identity.user.email = auth_hash['info']['email']
      identity.user.save!
      identity
    end
  end
end
