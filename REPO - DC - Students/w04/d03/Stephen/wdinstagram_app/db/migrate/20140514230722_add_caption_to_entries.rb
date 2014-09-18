class AddCaptionToEntries < ActiveRecord::Migration
  change_table :entries do |t|
    t.text :caption
  end
end
