class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.boolean :explicit_lyrics, :boolean, default: true
      t.text :videa_embed_url
    end
  end
end
