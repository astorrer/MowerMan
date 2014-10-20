source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
gem "activerecord-session_store", github: "rails/activerecord-session_store"

gem 'haml-rails' # Use HAML as the templating engine
gem 'pg' # Use postgresql for development, testing, and production
gem 'simple_form' # Use the simple form DSL
gem 'foundation-rails' #Use foundation for the CSS framework
gem 'devise', '~>3.2'
gem 'milia', '~>1.0'
gem 'sass-rails', '~> 4.0.3' # Use SCSS for stylesheets
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'figaro'

gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem "recaptcha", require: "recaptcha/rails" # Set to false for now.

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rails_12factor', group: :production

group :development, :test do
	gem "rspec-rails", "~> 3.1.0"
	gem "factory_girl_rails", "~> 4.4.1"
end

group :test do
	gem "faker", "~> 1.4.3"
	gem 'shoulda-matchers', require: false
	gem "capybara", "~> 2.4.3"
	gem "database_cleaner", "~> 1.3.0"
	gem "launchy", "~> 2.4.2"
	gem "selenium-webdriver", "~> 2.43.0"
end