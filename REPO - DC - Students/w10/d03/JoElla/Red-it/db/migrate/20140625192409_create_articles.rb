class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :url
      t.text :title
      t.integer :votes
      t.timestamps
    end
  end
end
