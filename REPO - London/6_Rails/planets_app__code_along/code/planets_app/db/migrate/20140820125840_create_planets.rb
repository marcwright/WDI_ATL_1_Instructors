class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :image
      t.float :orbit
      t.float :mass
      t.integer :moons, limit: 2
      t.float :diameter

      t.timestamps
    end
  end
end
