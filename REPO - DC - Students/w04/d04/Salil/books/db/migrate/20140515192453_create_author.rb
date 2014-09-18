class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birthday
      t.string :gender
      t.boolean :has_pseudo
    end
  end
end
