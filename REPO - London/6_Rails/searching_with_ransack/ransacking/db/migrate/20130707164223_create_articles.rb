class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.time :published_at
      t.references :author
      t.references :moderator

      t.timestamps
    end
    add_index :articles, :author_id
    add_index :articles, :moderator_id
  end
end
