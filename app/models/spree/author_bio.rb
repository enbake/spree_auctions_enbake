class Spree::AuthorBio < ActiveRecord::Base
  attr_accessible :name, :biography
  validates :name, presence: true, uniqueness: true

  has_many :products, :class_name => "Spree::Product"
  has_many :photos, as: :imageable, :class_name => "Spree::Photo", :dependent => :destroy
end
