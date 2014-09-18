class ChangeAuthors < ActiveRecord::Migration
  def change
    change_table :authors do |t|
      t.remove :has_pseudonym
      t.boolean :has_pseudonym, :default => false
    end
  end
end
