class AddBookIDtoCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :book_id, :integer
  end
end
