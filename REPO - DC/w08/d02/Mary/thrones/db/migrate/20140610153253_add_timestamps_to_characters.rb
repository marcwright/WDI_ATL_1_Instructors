class AddTimestampsToCharacters < ActiveRecord::Migration
  def change
    add_column(:characters, :created_at, :datetime)
    add_column(:characters, :updated_at, :datetime)
  end
end
