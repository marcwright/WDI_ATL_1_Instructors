class Score < ActiveRecord::Base
  belongs_to :player, class_name: 'User'
  belongs_to :game
  attr_accessible :result, :value, :player_id, :game_id
end
