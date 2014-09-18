class AddColumnImageUrl < ActiveRecord::Migration
  def change
    add_column :authors, :image_url, :text
  end
end
