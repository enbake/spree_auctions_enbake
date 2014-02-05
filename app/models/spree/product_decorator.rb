module Spree
  Product.class_eval do
    delegate_belongs_to :master, :bid_price
    has_and_belongs_to_many :categories, :class_name => "Spree::Category", :join_table => "products_categories"
    has_many :photos, :class_name => "Spree::Photo", :dependent => :destroy

    attr_accessor :categories_id, :action
    attr_accessible :bid_price
    after_save :save_categories
    
    private
    
    def save_categories
      unless self[:categories_id].empty?
        self.categories = Spree::Category.find(self[:categories_id])
      end if self[:categories_id]
    end
  end
end
