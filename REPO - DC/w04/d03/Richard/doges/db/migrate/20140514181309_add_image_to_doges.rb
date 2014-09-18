class AddImageToDoges < ActiveRecord::Migration
  def change
    add_column :doges, :image_url, :text
  end
end
