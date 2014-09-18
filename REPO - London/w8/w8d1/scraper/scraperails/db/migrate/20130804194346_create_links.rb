class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :search_term
      t.string :text
      t.text :uri

      t.timestamps
    end
  end
end
