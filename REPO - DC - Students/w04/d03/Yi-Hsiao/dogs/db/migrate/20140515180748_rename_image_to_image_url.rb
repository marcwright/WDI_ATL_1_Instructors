class RenameImageToImageUrl < ActiveRecord::Migration
  def change
    rename_column(:dogs, :image, :image_url)
  end
end
