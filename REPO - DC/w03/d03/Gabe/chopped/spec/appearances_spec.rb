class Appearance < ActiveRecord::Base
validates_presence_of :which_chef
validates_presence_of :which_round
 belongs_to :round
 belongs_to :chef
end
