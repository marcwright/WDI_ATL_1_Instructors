class CreateSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.text :preview_url
    end
  end
end
