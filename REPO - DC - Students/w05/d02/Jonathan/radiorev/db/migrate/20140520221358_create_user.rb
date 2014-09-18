class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
    end

    # This creates a table (maybe invisible?)
    # that track the cookies and sessions
    # and stores the authentification match
    # on the database but NOT PRIVATE USER INFO
    add_index :users, :email, unique: true
    add_index :users, :remember_token

  end
end