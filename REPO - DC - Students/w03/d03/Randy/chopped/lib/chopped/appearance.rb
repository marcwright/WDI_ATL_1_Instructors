class Appearance < ActiveRecord::Base
  belongs_to :judge, foreign_key: 'judge_id'
  belongs_to :episode, foreign_key: 'episode_id'

  validates_numericality_of :judge_id, only_integer: true
  validates_numericality_of :episode_id, only_integer: true
end
