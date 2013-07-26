class AddBidPriceToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :bid_price, :float
  end
end
