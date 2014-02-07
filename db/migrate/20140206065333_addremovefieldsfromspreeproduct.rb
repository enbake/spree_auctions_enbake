class Addremovefieldsfromspreeproduct < ActiveRecord::Migration
  def up
    add_column :spree_products, :auction_end, :datetime
    add_column :spree_products, :minimal_price, :decimal
    add_column :spree_products, :created_date, :datetime
    add_column :spree_products, :art_topics, :string
    add_column :spree_products, :techniques, :string
    add_column :spree_products, :signature, :string
    add_column :spree_products, :art_width, :string
    add_column :spree_products, :art_height, :string
    add_column :spree_products, :art_depth, :string
  end
  
  def down
    remove_column :spree_products, :auction_end
    remove_column :spree_products, :minimal_price
    remove_column :spree_products, :created_date
    remove_column :spree_products, :art_topics
    remove_column :spree_products, :techniques
    remove_column :spree_products, :signature
    remove_column :spree_products, :art_width
    remove_column :spree_products, :art_height
    remove_column :spree_products, :art_depth
  end
end
