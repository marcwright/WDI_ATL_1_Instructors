class CreateBook < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date  :date
      t.string  :genre
    end
  end
end
