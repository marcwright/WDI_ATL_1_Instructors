class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.text   :preview_url

      t.timestamps
    end
  end
end
