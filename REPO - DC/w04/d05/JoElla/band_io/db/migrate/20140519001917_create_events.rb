class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :time
      t.references :band
      t.references :venue
    end
  end
end
