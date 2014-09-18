class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :haml_input
      t.text :scss_input
      t.text :description

      t.timestamps
    end
  end
end
