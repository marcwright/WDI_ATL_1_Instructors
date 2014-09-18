class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.string :photo_url
      t.references :dog
      t.timestamps
    end
  end
end
