class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.float :rating
      t.text :plot_summary
    end
  end
end
