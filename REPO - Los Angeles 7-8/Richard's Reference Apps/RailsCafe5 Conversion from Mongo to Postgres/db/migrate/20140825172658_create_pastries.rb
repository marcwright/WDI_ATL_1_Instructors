class CreatePastries < ActiveRecord::Migration
  def change
    create_table :pastries do |t|
      t.string :name
      t.string :dept
      t.decimal :price

      t.timestamps
    end
  end
end
