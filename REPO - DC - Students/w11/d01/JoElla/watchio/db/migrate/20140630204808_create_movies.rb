class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :title
      t.text :imdbID
      t.timestamps
    end
  end
end
