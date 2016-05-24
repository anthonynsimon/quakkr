source 'https://rubygems.org'

# Use Devise for users registration/login
gem 'devise'

# Use puma as the app server
gem 'puma'

# Kaminari for pagination
gem 'kaminari'

# Required to avoid conflict between jquery and turbolinks
gem 'jquery-turbolinks'

# Paperclip for image attachments
gem 'paperclip'

# Used for 'Like' feature
gem 'acts_as_votable'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

gem 'tzinfo-data'

# Bootstrap 4 for the web front end
gem 'bootstrap', '~> 4.0.0.alpha3'

gem "font-awesome-rails"

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'faker'

group :production do
  # Needed for proper deployment on Heroku
  gem 'rails_12factor'
  
  # Using Postgres as DB
  gem 'pg'
  
  # ImageMagick for use in Heroku
  #gem 'rmagick'
end

group :test do
  
  gem 'capybara'
  
  gem 'shoulda-matchers'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  
  gem 'factory_girl_rails'
  
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'sqlite3'
end

