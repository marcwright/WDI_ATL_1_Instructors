class AddCharacterTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.boolean :dead, default: false
    end
  end
end
