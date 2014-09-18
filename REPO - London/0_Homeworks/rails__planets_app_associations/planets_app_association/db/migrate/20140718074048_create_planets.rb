class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.float :orbit
      t.text :image
      t.float :diameter
      t.float :mass
      t.integer :galaxy_id

      t.timestamps
    end
  end
end
