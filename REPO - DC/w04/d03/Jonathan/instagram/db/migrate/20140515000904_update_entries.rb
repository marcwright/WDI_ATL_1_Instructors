class UpdateEntries < ActiveRecord::Migration
  def change
    rename_table :users, :entries
  end
end
