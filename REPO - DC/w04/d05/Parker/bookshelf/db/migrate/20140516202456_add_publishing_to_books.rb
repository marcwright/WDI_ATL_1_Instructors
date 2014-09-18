class AddPublishingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :publishing, :string
  end
end
