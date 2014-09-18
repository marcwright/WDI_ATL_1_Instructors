class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, :null => false
      t.boolean :dead, :default => false
      t.timestamps
    end
  end
end
