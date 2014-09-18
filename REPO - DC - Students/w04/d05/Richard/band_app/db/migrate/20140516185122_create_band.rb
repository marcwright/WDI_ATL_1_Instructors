class CreateBand < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, :unique => true
      t.string :genre
      t.boolean :explicit_lyrics
      t.text :video_embed_url
      t.timestamps
    end
  end
end
