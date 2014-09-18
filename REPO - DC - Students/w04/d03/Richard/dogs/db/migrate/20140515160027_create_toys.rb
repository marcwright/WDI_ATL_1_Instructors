class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name #creates column varchar(255)
      t.references :dog #references dog table
      t.text :photo_url #creates text for photo
      t.timestamps
    end
  end
end
