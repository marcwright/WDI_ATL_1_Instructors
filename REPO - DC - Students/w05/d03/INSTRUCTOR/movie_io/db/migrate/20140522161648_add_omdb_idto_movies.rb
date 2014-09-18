class AddOmdbIdtoMovies < ActiveRecord::Migration
  def change
    add_column :movies, :imdb_id, :string
  end
end
