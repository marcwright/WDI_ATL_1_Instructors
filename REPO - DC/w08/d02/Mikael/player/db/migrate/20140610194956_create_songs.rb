class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist, null: false
      t.string :title, null: false
      t.text :preview_url, null: false
      t.timestamps
    end
  end
end
