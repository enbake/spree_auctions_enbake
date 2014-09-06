class AddFieldsToUserAddress < ActiveRecord::Migration
  def change
    add_column :spree_user_addresses, :com_street, :string, :default => ""
    add_column :spree_user_addresses, :com_street_no, :string, :default => ""
    add_column :spree_user_addresses, :com_house_no, :string, :default => ""
    add_column :spree_user_addresses, :com_apartment_no, :string, :default => ""
    add_column :spree_user_addresses, :com_city, :string, :default => ""
    add_column :spree_user_addresses, :com_land_line_no, :string, :default => ""
    add_column :spree_user_addresses, :com_mobile_no, :string, :default => ""
    add_column :spree_user_addresses, :com_state, :string, :default => ""
    add_column :spree_user_addresses, :com_zip_code, :string, :default => ""
    add_column :spree_user_addresses, :com_country, :string, :default => ""
  end
end