class AddAgeToDoges < ActiveRecord::Migration
  def change
    add_column :doges, :age, :integer
  end
end
