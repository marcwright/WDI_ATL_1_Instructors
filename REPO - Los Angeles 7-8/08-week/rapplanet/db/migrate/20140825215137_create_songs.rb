class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :duration
      t.references :rapper, index: true

      t.timestamps
    end
  end
end
