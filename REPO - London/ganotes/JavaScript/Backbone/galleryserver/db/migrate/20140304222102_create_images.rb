class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :url
      t.references :album

      t.timestamps
    end
    add_index :images, :album_id
  end
end