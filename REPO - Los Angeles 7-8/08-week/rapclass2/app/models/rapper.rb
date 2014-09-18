class Rapper < ActiveRecord::Base
	has_many :songs
	validates_numericality_of :age, greater_than_or_equal_to: 42
	validates_presence_of :name, message: "cannot rap without a game!"
end
