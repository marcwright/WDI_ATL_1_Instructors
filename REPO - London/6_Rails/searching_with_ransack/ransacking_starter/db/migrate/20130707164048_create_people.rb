class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :dob
      t.string :title
      t.string :account_number

      t.timestamps
    end
  end
end
