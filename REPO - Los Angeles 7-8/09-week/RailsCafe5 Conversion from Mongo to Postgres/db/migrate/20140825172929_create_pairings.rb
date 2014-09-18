class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.references :bean, index: true
      t.references :pastry, index: true

      t.timestamps
    end
  end
end
