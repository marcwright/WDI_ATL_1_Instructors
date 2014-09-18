class Person < ActiveRecord::Base
	scope :with_brown_hair, -> { where( hair_color: caps('brown') ) }
	scope :with_blond_hair, -> { where( hair_color: caps('blonde') + caps('blond') ) }
	scope :with_red_hair, -> { where( hair_color: caps('red') )}
	scope :with_black_hair, -> { where(hair_color: caps('black') )}

	scope :with_blue_eyes, -> { where(eye_color: caps('blue') )}
	scope :with_green_eyes, -> { where(eye_color: caps('green') )}
	scope :with_brown_eyes, -> { where(eye_color: caps('brown') )}

	scope :under_age, -> (given_age) { where( "age < ? ", given_age )}
	scope :over_age, -> (given_age) { where( "age >= ? ", given_age )}

	private

	def self.caps(word)
		[word, word.capitalize]
	end

end
