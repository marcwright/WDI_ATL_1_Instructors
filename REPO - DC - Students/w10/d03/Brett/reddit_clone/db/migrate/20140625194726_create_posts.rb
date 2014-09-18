class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url, null: false
      t.string :title
      t.integer :upvotes, default: 1
      t.timestamps
    end
  end
end
