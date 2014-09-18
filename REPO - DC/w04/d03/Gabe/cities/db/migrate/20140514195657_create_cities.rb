class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :avg_salary
      t.text :image_url
    end
  end
end
