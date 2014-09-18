class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
    t.float :latitude, null: false
    t.float :longitude, null: false
    t.timestamps
    end
  end
end
