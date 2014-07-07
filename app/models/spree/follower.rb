class Spree::Follower < ActiveRecord::Base
 attr_accessible :user_id, :product_id
belongs_to :product
belongs_to :user

end