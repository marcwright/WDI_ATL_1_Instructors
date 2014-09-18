class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.boolean :destroyed
      t.references :dog, index: true

      t.timestamps
    end
  end
end
