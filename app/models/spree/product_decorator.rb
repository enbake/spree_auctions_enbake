module Spree
  Product.class_eval do
    delegate_belongs_to :master, :bid_price

    attr_accessible :bid_price
  end
end
