class Rapper < ActiveRecord::Base
	has_many :songs
	validates :age, numericality: {greater_than_or_equal_to: 42}
	validates :name, presence: {message: "cannot rap without a name!"}

	def name
		[name, age].join " "
	end

end
