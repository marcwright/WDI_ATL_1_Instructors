class AddPhotoUrlToToys < ActiveRecord::Migration
  def change
    add_column :toys, :photo_url, :text
  end
end
