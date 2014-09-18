require_relative '../lib/fortune'

describe FortuneCookie do
	let( :fortune ){FortuneCookie.new }

	describe "::new" do
	it "starts wrapped?" do
		expect(FortuneCookie.new.wrapped?).to be_truthy
		end
	end

	describe "#unwrap!" do
		it "unwraps the fortune cookie" do
			fortune.unwrap!
			expect(fortune.wrapped?).to be_falsey	
		end
	end

	describe "crack!" do
		it "cracks the cookie if unwrapped" do
				fortune.unwrap!
				fortune.crack!
			expect(fortune.crack!).to be_truthy
		end
		it "does not crack if cookie is still wrapped" do
			fortune.crack!
			expect(fortune.cracked?).to be_falsey
		end
	end

	describe "#read the fortune" do
		it "tells you to unwrap it if it is still wrapped" do
			expect(fortune.read).to eq("Unwrap me!")
		end


		context "when the fortune cookie is unwrapped." do	################
			before {fortune.unwrap!}

			it "tells you to crack it, if it's uncracked" do
				expect(fortune.read).to eq("Crack me!")
			end
			it "Reads you the fortune if it is unwrapped and cracked" do
				fortune.crack!
				expect(fortune.read).to eq("You will be really good at testing!")
			end
		end	
	end

end