class Spree::Bid < ActiveRecord::Base
  attr_accessible :date, :price, :variant_id, :user_id,:product_id
  belongs_to :product
  belongs_to :user

  def self.place_bid(bid, user)
    bid_obj = Spree::Bid.find_or_initialize_by_variant_id_and_user_id(bid.variant_id, user.id)
    bid_obj.price = bid.price
    bid_obj.save
  end

end