class Spree::UserMailer < ActionMailer::Base
  default :from => "support@spreeauction.com"
  
  def contact_user(user, order)
    contact = Spree::User.find user
    @order = order
    mail(:to => contact.email, :subject => "Welcome to Spree")
  end
end


