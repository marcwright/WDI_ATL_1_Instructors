class RenameImageUrlToImage < ActiveRecord::Migration
  def change
    rename_column(:dogs, :image_url, :image)
  end
end
