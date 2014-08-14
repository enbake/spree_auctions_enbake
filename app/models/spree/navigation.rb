class Spree::Navigation < ActiveRecord::Base
  attr_accessible :name, :url, :private, :custom_url
end
