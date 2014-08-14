class AddCustomUrlToSpreeNavigation < ActiveRecord::Migration
  def change
    add_column :spree_navigations, :custom_url, :boolean, :default => false
  end
end
