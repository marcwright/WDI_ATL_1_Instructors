class AddNotNullToCharacterName < ActiveRecord::Migration
  def change
    change_column :characters, :name, :string, :null => false
  end
end
