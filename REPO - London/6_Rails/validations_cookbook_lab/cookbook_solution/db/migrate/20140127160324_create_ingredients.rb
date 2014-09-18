class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.boolean :gluten_free
      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
