class RenameDob < ActiveRecord::Migration
  def change
    rename_column :authors, :do, :dob
  end
end
