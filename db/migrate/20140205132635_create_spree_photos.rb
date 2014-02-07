class CreateSpreePhotos < ActiveRecord::Migration
  def change
    create_table :spree_photos do |t|
      t.attachment :file
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
