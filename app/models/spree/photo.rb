class Spree::Photo < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true, :class_name => "Spree::Product"
  belongs_to :author_bio, :class_name => "Spree::AuthorBio"
  attr_accessible :file
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
