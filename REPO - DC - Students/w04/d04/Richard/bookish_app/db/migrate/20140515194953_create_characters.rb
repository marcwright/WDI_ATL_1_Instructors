class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :quirk
      t.references :book
      t.timestamps
    end
  end
end
