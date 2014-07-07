class CreateSpreeFollowers < ActiveRecord::Migration
  def change
    create_table :spree_followers do |t|
      t.references :user
      t.references :product
      t.timestamps
    end
  end
end
