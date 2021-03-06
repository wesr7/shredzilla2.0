source 'https://rubygems.org'
ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'pundit' # using pundit gem for user authorization, using roles table.
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'active_model_serializers' # For API purposes.
gem 'kaminari' # Pagination
gem 'geocoder' # Just a really useful gem, makes finding lat/lon information a breeze.
gem 'figaro' # To hide sensitive information.
gem 'omniauth' # For social media logins.
gem 'omniauth-facebook' # Facebook OAuth
gem 'omniauth-twitter' # Twitter OAuth
gem 'omniauth-google-oauth2' # Google OAuth
gem 'bootstrap-sass' # Twitter Bootstrap CSS Framework
gem 'font-awesome-rails' # Font Awesome Library Gem
gem 'sidekiq' # Background processing for Ruby.
gem 'simple_form' # Better form helpers.
gem 'tinymce-rails' # TinyMCE rich text editor for textareas
gem 'whenever', :require => false
gem 'httparty'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'pry-rails' # so much better than the default IRB console
  gem 'better_errors' # much better and informational than the default red error pages.
  gem 'awesome_print' # makes data in console easier to read, especially JSON data.
  gem 'annotate' # this will put the schema of the database on top of each model file so you never have to open the schema to check out field names.
  gem 'rails-footnotes' # this will put useful information at the bottom of each view for development purposes only.
  gem 'factory_girl' # used to set up Ruby objects to use as test data.
  gem 'capybara' # user story / feature testing.
  gem 'rspec-rails' # controller and model testing.
  gem 'pundit' # using pundit gem for user authorization, using roles table.
  gem 'seed_dump'
end

group :production do
  gem 'thin' #better than webrick web server
  gem 'rails_12factor' #for heroku
end
