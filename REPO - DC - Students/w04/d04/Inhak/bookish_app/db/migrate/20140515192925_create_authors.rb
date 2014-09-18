class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :dob
      t.string :gender
      t.boolean :has_pseudonym, { :default => false }
      t.timestamps
    end
  end
end
