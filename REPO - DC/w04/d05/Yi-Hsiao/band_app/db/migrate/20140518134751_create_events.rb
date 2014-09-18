class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :venue
      t.belongs_to :band
      t.datetime :date_time
      t.timestamps
    end
  end
end
