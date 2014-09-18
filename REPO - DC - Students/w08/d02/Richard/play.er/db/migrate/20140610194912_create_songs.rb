class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist, null: false
      t.string :song_title, null: false
      t.text :preview_url, null: false
    end
  end
end
