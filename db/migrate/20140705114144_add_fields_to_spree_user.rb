class AddFieldsToSpreeUser < ActiveRecord::Migration
  def change
    add_column :spree_users, :frequency, :integer, :default => 0
    add_column :spree_users, :day_of_week, :integer, :default => 1
    add_column :spree_users, :day_of_month, :integer, :default =>1
  end
end
