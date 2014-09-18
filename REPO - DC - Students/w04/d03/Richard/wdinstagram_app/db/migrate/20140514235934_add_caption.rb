class AddCaption < ActiveRecord::Migration
  def change
    add_column :entries, :caption, :string
  end
end
