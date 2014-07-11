class CreateSpreeCustomEmailContents < ActiveRecord::Migration
  def change
    create_table :spree_custom_email_contents do |t|
      
      t.string :name
      t.text :body
      t.string :language
      t.timestamps
    end
  end
end
