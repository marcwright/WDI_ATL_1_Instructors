class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.timestamps

      t.index :email, unique: true
      t.index :remember_token
    end
  end
end
