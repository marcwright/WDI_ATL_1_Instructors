class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string   :time
      t.references :venue
      t.references :band
      t.timestamps
    end
  end
end
