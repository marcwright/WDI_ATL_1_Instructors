class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.references :author
      t.date :release_date
      t.string :genre
    end
  end
end
