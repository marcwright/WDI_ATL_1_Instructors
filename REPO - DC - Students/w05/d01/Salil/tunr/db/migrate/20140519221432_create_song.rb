class CreateSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :year
    end
  end
end
