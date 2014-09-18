class CreateTableForSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.text :preview_url
    end
  end
end
