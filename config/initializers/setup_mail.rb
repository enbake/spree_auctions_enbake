#config.action_mailer.raise_delivery_errors = true
#config.action_mailer.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => "587",
  :authentication => :plain,
  :user_name => "dummy09807@gmail.com",
  :password => "dummy0000"
}
