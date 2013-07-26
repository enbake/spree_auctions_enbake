class Spree::UserMailer < ActionMailer::Base
  default :from => "support@spreeauction.com"
  
  def contact_user(user)
    contact = Spree::User.find user
    mail(:to => contact.email, :subject => "Welcome to Spree")
  end
end


