class AddTranslationToNavigation < ActiveRecord::Migration
  def up
    Spree::Navigation.create_translation_table! :name => :string
  end
  def down
    Spree::Navigation.drop_translation_table!
  end 
end
