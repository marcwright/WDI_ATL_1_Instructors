class CreateEntriesTable < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :author
      t.text :photo_url
      t.date :date
    end
  end
end
