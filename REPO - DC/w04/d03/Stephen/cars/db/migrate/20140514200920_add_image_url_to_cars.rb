class AddImageUrlToCars < ActiveRecord::Migration
  def change
    add_column :cars, :image_url, :text
  end
end
