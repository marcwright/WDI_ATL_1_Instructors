class CreateEntriesTable < ActiveRecord::Migration
  def change
    create_table :entries_tables do |t|
      t.string :author
      t.text :photo_url
      t.date :date_taken
    end
  end
end
