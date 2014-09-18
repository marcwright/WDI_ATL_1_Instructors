class CreateDoges < ActiveRecord::Migration
  def change
    create_table :doges do |t|
      t.string :name #creates column varchar(255)
      t.text :image_url #creates column text
    end
  end
end
