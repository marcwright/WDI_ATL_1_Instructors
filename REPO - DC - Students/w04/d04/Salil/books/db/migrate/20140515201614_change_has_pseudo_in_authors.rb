class ChangeHasPseudoInAuthors < ActiveRecord::Migration
  def change
    change_column :authors, :has_pseudo, :boolean, default: false
  end
end
