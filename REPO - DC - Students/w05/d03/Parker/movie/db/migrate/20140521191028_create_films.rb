class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :attribute

      t.timestamps
    end
  end
end
