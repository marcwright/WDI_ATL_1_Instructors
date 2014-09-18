class CreatePin < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.float :lat, null: false
      t.float :long, null:false
    end
  end
end
