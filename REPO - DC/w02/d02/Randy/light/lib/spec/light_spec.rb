#TDD - Write test first
#Red --> Green --> Refactor
	#Write a test that will fail:
		#Write enough code to make test pass:
			#Go back and Refactor

require_relative '../light'

#We use describe blocks for:
# ::classes & #methods

describe Light do
		# :: denotes we will be describing a class method
	describe "::new" do
			#Use keyword 'it' for the actual tests
		it "starts off" do
			light = Light.new
			expect( light.on? ).to be_false #We write our expectation.
		end
	end
	describe "#flip!" do #The # denotes a instance method
		it "turns the light on if it is off" do
			light = Light.new
			light.flip!
			expect( light.on? ).to be_true
		end
		it "turns the light off if it is on" do
			light = Light.new
			light.flip!
			light.flip!
			expect( light.on? ).to be_false
		end
	end

end

