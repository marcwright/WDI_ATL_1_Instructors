class CreateCharacter < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.text :quirk
    end
  end
end
