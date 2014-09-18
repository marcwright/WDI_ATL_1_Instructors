class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.time :time
      t.date :date
      t.references :band
      t.references :venue
    end
  end
end
