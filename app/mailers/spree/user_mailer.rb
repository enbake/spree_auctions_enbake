class Spree::UserMailer < Devise::Mailer
  default :from => "support@spreeauction.com"
  
  def contact_user(user, order)
    contact = Spree::User.find user
    @order = order
    subject = "#{Spree.t('order_mailer.confirm_email.bid_email_subject')}"
    mail(:to => contact.email, :subject => subject)
  end
end


