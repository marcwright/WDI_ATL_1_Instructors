class CreateDoges < ActiveRecord::Migration
  def change
    create_table :doges do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_attachment :doges, :picture
  end
end
