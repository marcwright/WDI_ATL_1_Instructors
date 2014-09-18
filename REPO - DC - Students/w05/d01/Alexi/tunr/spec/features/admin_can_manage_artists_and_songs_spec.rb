require "spec_helper"

describe "an admin can manage artists and songs" do
    let!(:beyonce) { Artist.create(:name => "Beyonce", :genre => "Pop", :photo_url => "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg")}
    let!(:crazy)   { Song.create(:title => "Crazy in Love", :year => 2003, :artist_id => artist_id) }

    it " can create a new song" do
      visit new_artist_song_path
      fill_in "song_name", with: "Crayz in love"
      fill_in "song_year", with: 2003
      click_button("submit")
      expect(page).to have_content "Crazy in love"
    end

end # END an admin can manage artists and songs"
