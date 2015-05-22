Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], { 
    :scope => 'email,public_profile,user_friends',
    :image_size => {
      :width => '500',
      :height => '500'
    }, 
    :display => 'popup'
  }
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET'], scope: 'profile', image_aspect_ratio: 'square', image_size: 500, access_type: 'online', name: 'google'
end