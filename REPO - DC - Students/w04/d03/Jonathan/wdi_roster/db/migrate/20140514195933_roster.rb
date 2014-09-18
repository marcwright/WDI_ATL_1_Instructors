class Roster < ActiveRecord::Migration
  def change
    create_table :wdi_roster do |t|
      t.string :name
      t.string :email
      t.text :image_url
    end
  end
end
