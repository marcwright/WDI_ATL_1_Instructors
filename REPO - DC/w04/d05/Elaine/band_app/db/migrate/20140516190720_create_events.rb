class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.references :venue
      t.references :band
      t.timestamps
    end
  end
end
