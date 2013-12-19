class Spree::Category < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :products, :class_name => "Spree::Product", :join_table => "products_categories"
end
