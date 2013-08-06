module Spree
  PaymentNotificationsController.class_eval do
    protect_from_forgery :except => [:create]
    skip_before_filter :restriction_access

    def create
      @order = Spree::Order.find_by_number(params[:invoice])
      Spree::PaymentNotification.create!(:params => params,
        :order_id => @order.id,
        :status => params[:payment_status],
        :transaction_id => params[:txn_id])


      render :nothing => true
    end

  end
end