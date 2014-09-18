class CreateStarwars < ActiveRecord::Migration
  def change
    create_table :starwars do |t|
      t.string :name
      t.text :image_url
    end
  end
end
