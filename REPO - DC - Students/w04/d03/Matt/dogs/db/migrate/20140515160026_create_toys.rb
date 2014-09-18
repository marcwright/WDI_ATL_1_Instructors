class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.reference :dog
      t.text :photo_url
      t.timestamps
    end
  end
end
