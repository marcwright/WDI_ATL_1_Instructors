class CreateBand < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.boolean :explicit
      t.text :video_url
    end
  end
end
