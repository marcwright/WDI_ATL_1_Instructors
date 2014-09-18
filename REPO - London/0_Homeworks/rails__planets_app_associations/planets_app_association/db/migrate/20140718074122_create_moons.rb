class CreateMoons < ActiveRecord::Migration
  def change
    create_table :moons do |t|
      t.string :name
      t.integer :planet_id
      t.boolean :is_solid

      t.timestamps
    end
  end
end
