class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end
  end
end
