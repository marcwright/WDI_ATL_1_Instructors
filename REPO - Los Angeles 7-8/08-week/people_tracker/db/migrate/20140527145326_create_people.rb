class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.integer :height_in_inches
      t.string :eye_color
      t.string :hair_color

      t.timestamps
    end
  end
end
