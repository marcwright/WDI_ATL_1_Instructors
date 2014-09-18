class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :author
      t.string :title
      t.date :release_date
      t.string :genre
    end
  end
end
