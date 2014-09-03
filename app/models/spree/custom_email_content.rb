class Spree::CustomEmailContent < ActiveRecord::Base
   attr_accessible :name, :body, :language
   validates_uniqueness_of :name
   
   serialize :body, Hash
end
