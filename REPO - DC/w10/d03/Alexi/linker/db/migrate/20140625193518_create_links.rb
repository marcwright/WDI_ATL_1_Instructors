class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string  :title, null: false
      t.string  :votes, default: 1
      t.text  :url
      t.timestamps
    end
  end
end
