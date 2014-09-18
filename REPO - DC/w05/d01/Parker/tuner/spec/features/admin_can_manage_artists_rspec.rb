require "spec_helper"

describe "an admin can manage artists" do
	let(:beyonce) ( Artist.create(:name => "Beyonce", :genre "pop"))


	it "can create a new artist" do
		visit new_artist_path
		fill_in "name", with: "Kesha"
		fill_in "genre". with: "garbage"
		fill_in "photo_url" with: "
		click("Button Value")
		expect(page).to have_content "Kesha"
end

it "can view an exisiting artist" do
	visit artist_path(beyonce)
	expect(page).to have_content "Queen Bey"
end

it "can update an exisiting artist" do
	vist artist_path(beyonce)
	expect(page).to have_content "Queens Bey"

