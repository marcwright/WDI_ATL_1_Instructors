# run rake db:migrate to run the migration

class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name      # name varchar(255)
      t.text :image_url   # image_url text
    end
  end
end
