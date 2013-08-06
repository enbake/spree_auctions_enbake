module Spree
  PaymentNotification.class_eval do

    attr_accessible :params, :order_id, :status, :transaction_id
  end
end
