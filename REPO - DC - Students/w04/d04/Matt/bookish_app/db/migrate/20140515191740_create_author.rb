class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :author
      t.date :dob
      t.string :gender
      t.boolean :has_pseudonym, default: false
    end
  end
end
