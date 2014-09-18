class CreateKangarooLocations < ActiveRecord::Migration
  def change
    create_table :kangaroo_locations do |t|
      t.string :latitude
      t.string :longitude
    end
  end
end
