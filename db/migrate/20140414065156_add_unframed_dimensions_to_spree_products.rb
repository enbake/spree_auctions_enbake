class AddUnframedDimensionsToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :unframed_width, :string
    add_column :spree_products, :unframed_height, :string
  end
end
