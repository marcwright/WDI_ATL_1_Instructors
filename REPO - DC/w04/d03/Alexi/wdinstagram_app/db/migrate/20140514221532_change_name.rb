class ChangeName < ActiveRecord::Migration
  def change
    rename_table(:entries_tables, :entries)
  end
end
