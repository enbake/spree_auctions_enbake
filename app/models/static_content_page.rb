class StaticContentPage < ActiveRecord::Base
  attr_accessible :description, :title

  translates :description, :title
end
