class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.boolean :explicit_lyrics
      t.string :video_embed_url
    end
  end
end
