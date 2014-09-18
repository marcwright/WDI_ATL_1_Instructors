class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name #creates column varchar(255)
      t.integer :age #creates column integer
      t.text :image_url #creates column text
    end
  end
end
