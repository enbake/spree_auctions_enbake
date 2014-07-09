module Spree
  CreditCard.class_eval do
    belongs_to :user, class_name: 'Spree::User'
    attr_accessible :cc_type, :last_digits, :user_id, :paypal_card_id, :paypal_payer_id
  end
end
