class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.integer :price
      t.integer :quantity
    end
  end
end
