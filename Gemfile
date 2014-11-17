source 'https://rubygems.org'
gem 'rails', '4.1.7'
gem 'haml-rails'
gem 'whenever', :require => false
gem 'useragent' # Required to detect and block internet explorer.

gem 'phony_rails' # Use to enable validations on phone_numbers, rational numbers only. 
gem 'bootstrap-wysihtml5-rails'

# Use Prawn to generate PDFs
gem 'prawn'
gem 'prawn-table', '~> 0.1.0'

# Use gon to pass javascript variables to views
gem 'gon'

# Use the helpdesk gem as the IT & Application helpdesk
gem "helpdesk", :github => 'astorrer/helpdesk'

# Use twilio for SMS messaging
gem 'twilio-ruby'

# Use Mailboxer for internal messaging
gem 'mailboxer'

# Use searchkick (Depends on Elasticsearch)
gem "searchkick"

# Authentication Gems
gem 'devise', '3.2.2'
gem 'bcrypt-ruby', '3.1.2' # For encryption
gem "rolify" # Identify user roles
gem "cancan"

# Gems for CSV & XLS export. Does not export .XLSX files. (Yet)
gem 'to_xls-rails'# Last officially released gem
gem 'to_csv-rails'# Last officially released gem

# User I18n for translations
gem 'rails-i18n', '~> 4.0.0'

# Use chartkick for dynamic graphs
gem 'groupdate'
gem 'active_median'

# Use qr-code3
gem 'rqrcode-rails3'

# Jquery & Friends
gem 'jquery-rails'
gem 'momentjs-rails'
gem 'jquery-ui-rails'
gem "select2-rails"
gem 'bootstrap3-datetimepicker-rails', '~> 3.1.3'

gem 'time_difference' # Used for calculations. Must Install.

# Use for nested resources forms.
gem "cocoon"

# CSS interpreters and GUI Helpers
gem 'sass-rails', '4.0.3'
gem 'kaminari' # Enables easy pagination
gem 'kaminari-bootstrap', '~> 3.0.1' # Styles kaminari to match bootstrap

# Javascript interpreters, DSL, etc
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jbuilder'

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'newrelic_rpm' # For logging during production
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails', "~> 3.1.0"
  gem 'factory_girl_rails', "~> 4.4.1"
end

group :test do
  gem "faker", "~> 1.4.3"
  gem "capybara", "~> 2.4.3"
  gem "database_cleaner", "~> 1.3.0"
  gem "launchy", "~> 2.4.2"
  gem "selenium-webdriver", "~> 2.43.0"
end