class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url, null: false
      t.integer :upvotes, default: 0
      t.timestamps
    end
  end
end
