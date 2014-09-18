class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.boolean :explicit_lyrics, :default => false
      t.text :video_embed_url
    end
  end
end

# name
# genre
# explicit_lyrics (a boolean)
# video_embed_url
