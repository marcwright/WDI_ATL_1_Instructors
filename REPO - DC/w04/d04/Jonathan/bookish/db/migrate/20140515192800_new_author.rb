class NewAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :do
      t.string :gender
      t.boolean :has_pseudonym, :default => false
    end
  end
end
