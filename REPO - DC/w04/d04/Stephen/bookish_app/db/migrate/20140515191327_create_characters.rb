class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :quirk
      t.references :author, index: true
      t.references :book, index: true
    end
  end
end
