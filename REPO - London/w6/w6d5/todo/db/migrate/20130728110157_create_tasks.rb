class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.string :due_date
      t.string :today_task
      t.timestamps
    end
  end
end
