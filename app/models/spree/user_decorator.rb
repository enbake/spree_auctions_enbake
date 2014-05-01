module Spree
  User.class_eval do
    devise :confirmable
    attr_accessible :first_name, :last_name, :user_address_attributes
    
    has_one :user_address, :class_name => "Spree::UserAddress"
    accepts_nested_attributes_for :user_address
  end
end
