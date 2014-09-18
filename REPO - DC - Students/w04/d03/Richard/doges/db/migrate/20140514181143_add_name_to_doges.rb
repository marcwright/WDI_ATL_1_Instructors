class AddNameToDoges < ActiveRecord::Migration
  def change
    add_column :doges, :name, :string
  end
end
