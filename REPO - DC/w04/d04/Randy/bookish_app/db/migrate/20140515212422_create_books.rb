class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date :release_date
      t.string :genre
      t.references :author
    end
  end
end
