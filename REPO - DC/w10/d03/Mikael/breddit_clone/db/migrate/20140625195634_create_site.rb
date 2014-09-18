class CreateSite < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text :site_url, null: false
      t.string :title
      t.integer :rating
      t.timestamps
    end
  end
end
