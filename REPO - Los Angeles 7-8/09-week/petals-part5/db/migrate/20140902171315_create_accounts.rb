class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :owner_name
      t.string :ig_account
      t.float :engagement

      t.timestamps
    end
  end
end
