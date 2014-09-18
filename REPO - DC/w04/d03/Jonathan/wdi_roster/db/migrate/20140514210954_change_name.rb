class ChangeName < ActiveRecord::Migration
  def change
    rename_table :wdi_roster, :wdi_rosters
  end
end
