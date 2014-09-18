class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :gender
      t.date :date_of_birth
      t.boolean :has_pseudonym, default: false
    end
  end
end
