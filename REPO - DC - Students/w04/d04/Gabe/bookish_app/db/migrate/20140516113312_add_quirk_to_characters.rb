class AddQuirkToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :quirk, :string
  end
end
