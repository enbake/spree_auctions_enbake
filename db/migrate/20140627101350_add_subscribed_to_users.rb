class AddSubscribedToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :subscribed, :boolean, default: false 
  end
end
