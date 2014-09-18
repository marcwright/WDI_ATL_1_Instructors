class CreateWizards < ActiveRecord::Migration
  def change
    create_table :wizards do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :house
      t.boolean :is_muggle

      t.timestamps
    end
  end
end
