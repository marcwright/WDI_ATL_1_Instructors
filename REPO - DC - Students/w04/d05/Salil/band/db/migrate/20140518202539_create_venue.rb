class CreateVenue < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.string :state
      t.boolean :allows_profanity, default: false
    end
  end
end
