class AddColumnToMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :movie_url
    add_column :movies, :image_url, :text
    add_column :movies, :plot, :text

  end
end
