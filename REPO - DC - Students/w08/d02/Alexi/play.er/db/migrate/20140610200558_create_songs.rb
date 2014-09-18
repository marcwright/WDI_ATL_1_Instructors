class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist, null: false
      t.string :song, null: false
      t.text :song_url, null: false
    end
  end
end
