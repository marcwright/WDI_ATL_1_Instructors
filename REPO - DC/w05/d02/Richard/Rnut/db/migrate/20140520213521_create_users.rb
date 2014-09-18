class CreateUsers < ActiveRecord::Migration
  def change
    # table with paremeters for individual users
    # :password_digest holds our hashed password
    # :remember_token holds our hashed
    # remember_token for our users

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
    end
      # Fast Look ups to quickly get specific info
    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
