class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :title
      t.text :movie_url
    end
  end
end
