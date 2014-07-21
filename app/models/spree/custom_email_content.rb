class Spree::CustomEmailContent < ActiveRecord::Base
   attr_accessible :name, :body, :language
   validates :name, uniqueness: { scope: :language, :case_sensitive => false }
end
