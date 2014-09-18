class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birth
      t.string :gender
      t.boolean :has_pseudo
    end
  end
end
