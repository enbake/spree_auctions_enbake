#module Spree
 # class OrderMailer < Spree::BaseMailer
  #  def cancel_email(order, resend = false)
#      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
#      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
#      subject += "#{Spree::Config[:site_name]} #{Spree.t('order_mailer.cancel_email.subject')} ##{@order.number}"
#      mail(to: @order.email, from: from_address, subject: subject)
   # end
  #end
#end
