module Spree
  Variant.class_eval do

    attr_accessible :bid_price
    has_many :bids, :class_name => "Spree::Bid"
  end
end
