class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :firstname
      t.date :birthdate
      t.text :bio	
      t.timestamps
    end
  end
end
