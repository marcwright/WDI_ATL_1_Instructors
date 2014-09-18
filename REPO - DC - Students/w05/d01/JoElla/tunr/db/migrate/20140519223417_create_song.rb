class CreateSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :year
      t.string :title
      t.references :artist
    end
  end
end
