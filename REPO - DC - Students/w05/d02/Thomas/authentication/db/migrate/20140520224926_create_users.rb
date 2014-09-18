class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "name"
      t.string "email"
# the "has_secure_password" User relationship will rely on the below
      t.string "password_digest"
      t.string "remember_token"
    end

    add_index :users, :email, unique: true
    add_index :users, :remember_token

  end
end
