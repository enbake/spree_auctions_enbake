class AddTranslationToPage < ActiveRecord::Migration
  def up
    Spree::Page.create_translation_table! :title => :string,  :body => :text
  end
  def down
    Spree::Page.drop_translation_table!
  end
end