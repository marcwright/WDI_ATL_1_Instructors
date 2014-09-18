class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :state
      t.string :city
      t.boolean :allows_explicit_lyrics
    end
  end
end
