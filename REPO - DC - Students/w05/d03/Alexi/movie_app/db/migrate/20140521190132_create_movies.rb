class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :plot
      t.string :year
      t.text :rating
      t.text :poster_url
      t.boolean :favorite?
    end
  end
end
