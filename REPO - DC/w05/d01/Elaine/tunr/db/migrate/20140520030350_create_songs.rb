class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :artist
      t.string :title
      t.integer :year
    end
  end
end
