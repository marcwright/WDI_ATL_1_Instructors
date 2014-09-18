class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.float :long
      t.float :lat
    end
  end
end
