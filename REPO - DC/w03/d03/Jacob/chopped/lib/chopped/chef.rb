class Chef < ActiveRecord::Base
  belongs_to :episode
  has_many :dishes
  has_many :rounds, :through => :dishes
  validates_presence_of :name
  validates_numericality_of :episode_id, only_integer: true

end
