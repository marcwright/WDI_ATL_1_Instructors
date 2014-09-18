class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :location, null: false
      t.string :employment, null: false
    end
  end
end
