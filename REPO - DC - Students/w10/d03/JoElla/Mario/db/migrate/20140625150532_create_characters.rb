class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.text :img_url
      t.integer :coins
      t.timestamps
    end
  end
end
