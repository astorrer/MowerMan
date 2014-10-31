ActionMailer::Base.smtp_settings = {
  :address => "smtp.mandrillapp.com",
  :port => 587, # ports 587 and 2525 are also supported with STARTTLS
  :enable_starttls_auto => true,
  :user_name => Rails.application.secrets.mandrill_username
  :password => Rails.application.secrets.mandrill_api
  :authentication => :login,
  :domain => 'mowerman.net', # your domain to identify your server when connecting
}