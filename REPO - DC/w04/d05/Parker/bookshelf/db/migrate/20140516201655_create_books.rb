class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :title
    	t.integer :page_number
    	t.string :author
    	t.text :content
    end
  end
end
