class AuthenticationPractice < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :user_name
      t.string    :password_digest
      t.string    :remember_token
    end

    add_index     :users, :user_name, unique: true
    add_index     :users, :remember_token
  end
end
