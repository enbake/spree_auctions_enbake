module Spree
  Product.class_eval do
    delegate_belongs_to :master, :bid_price
    has_and_belongs_to_many :categories, :class_name => "Spree::Category", :join_table => "products_categories"
    has_many :photos, as: :imageable, :class_name => "Spree::Photo", :dependent => :destroy
    belongs_to :author_bio, :class_name => "Spree::AuthorBio"
    has_many :followers, :class_name => "Spree::Follower"

    attr_accessor :categories_id, :action
    attr_accessible :bid_price
    attr_accessible :auction_end
    attr_accessible :minimal_price
    attr_accessible :created_date
    attr_accessible :art_topics
    attr_accessible :techniques
    attr_accessible :signature
    attr_accessible :art_width
    attr_accessible :art_height
    attr_accessible :art_depth
    attr_accessible :author_bio_id
    attr_accessible :unframed_width
    attr_accessible :unframed_height
    
    validates :minimal_price, presence: true
    validates :auction_end, presence: true

    after_save :save_categories
    
    private
    
    def save_categories
      unless self[:categories_id].empty?
        self.categories = Spree::Category.find(self[:categories_id])
      end if self[:categories_id]
    end
  end
end
