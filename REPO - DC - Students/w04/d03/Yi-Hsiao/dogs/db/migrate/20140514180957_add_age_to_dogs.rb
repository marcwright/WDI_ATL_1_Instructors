class AddAgeToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :age, :integer
    # alter table dogs
    # add column age integer;
  end
end
