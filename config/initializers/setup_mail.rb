#config.action_mailer.raise_delivery_errors = true
#config.action_mailer.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => "587",
  :authentication => :plain,
  :user_name => "auctionshouse1@gmail.com",
  :password => "enbake123"
}
