class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :time
      t.references :venue
    end
  end
end
