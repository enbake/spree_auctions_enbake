class CreateSpreeUserAddresses < ActiveRecord::Migration
  def change
    create_table :spree_user_addresses do |t|
      t.string :street
      t.string :street_no
      t.string :house_no
      t.string :apartment_no
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :country
      t.boolean :company
      t.string :company_name
      t.string :nip
      t.references :user
      t.timestamps
    end
  end
end
