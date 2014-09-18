class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url, null: false
      t.string :title
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
