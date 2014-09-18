class AddAgeToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :age, :integer # :table name, :column, :type
  end
end
