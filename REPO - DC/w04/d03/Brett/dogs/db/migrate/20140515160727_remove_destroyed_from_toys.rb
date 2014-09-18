class RemoveDestroyedFromToys < ActiveRecord::Migration
  def change
    remove_column :toys, :destroyed, :boolean
  end
end
