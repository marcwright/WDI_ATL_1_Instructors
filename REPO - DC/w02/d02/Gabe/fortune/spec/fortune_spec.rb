require 'spec_helper'
require_relative '../lib/fortune'

describe FortuneCookie do

	describe "::new" do
		it "starts wrapped in a wrapper"do
		fortune = FortuneCookie.new
		expect(fortune.wrapped?).to be_true
		end
	end


	describe "#unwrap!" do
		it "unwraps the fortune cookie!"do
		fortune = FortuneCookie.new
		fortune.unwrap!
		expect(fortune.wrapped?).to be_false
		end
	end

	describe "#crack!" do
		it "checks to see if 'cracks' cracks open the cookie if its unwrapped!"do
		fortune = FortuneCookie.new
		fortune.unwrap!
		fortune.crack!
		expect(fortune.cracked?).to be_true
		end
	end


	describe "#crack!" do
		it "does not crack if the cookie is not unwrapped"do
		fortune = FortuneCookie.new
		fortune.crack!
		expect(fortune.cracked?).to be_false
		end
	end

	describe "#read" do
		it "wont read fortunes from uncracked or wrapped cookies"do
		fortune = FortuneCookie.new
		fortune.unwrap!
		expect(fortune.read?).to be_false
		end
	end

	describe "#read" do
		it "reads the fortune from unwrapped, cracked cookie"do
		fortune = FortuneCookie.new
		fortune.unwrap!
		fortune.crack!
		expect(fortune.read?).to be_true
		end
	end




  end