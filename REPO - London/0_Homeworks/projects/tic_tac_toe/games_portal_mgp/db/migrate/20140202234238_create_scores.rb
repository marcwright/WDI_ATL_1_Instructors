class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :result
      t.integer :value
      t.references :player
      t.references :game

      t.timestamps
    end
    add_index :scores, :player_id
    add_index :scores, :game_id
  end
end
