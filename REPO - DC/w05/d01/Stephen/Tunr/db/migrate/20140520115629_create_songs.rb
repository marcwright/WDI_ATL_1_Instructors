class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :video_url
      t.references :artist, index: true
    end
  end
end
