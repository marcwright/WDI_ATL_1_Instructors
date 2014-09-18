class CreateThinkers < ActiveRecord::Migration
  def change
    create_table :thinkers do |t|
      t.string :name
      t.string :quote
      t.text :image_url
    end
  end
end
