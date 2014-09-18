class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.decimal :imdb_rating, scale: 1, precision: 2
      t.text :plot
      t.text :poster_url
    end
  end
end
