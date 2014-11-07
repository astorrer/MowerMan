source 'https://rubygems.org'
gem 'rails', '4.1.7'
gem 'faker', '1.1.2'
gem 'haml-rails'
gem 'whenever', :require => false
gem 'useragent' # Required to detect and block internet explorer.

gem 'phony_rails' # Use to enable nice validations on phone_numbers

# Use Prawn to generate PDFs
gem 'prawn'
gem 'prawn-table', '~> 0.1.0'

# Use gon to pass javascript variables to views
gem 'gon'

# Use the helpdesk gem as the IT & Application helpdesk
gem "helpdesk", :github => 'wacaw/helpdesk'

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