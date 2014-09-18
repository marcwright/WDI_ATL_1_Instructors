require 'spec_helper'

describe "Admin can manage artists"  do
  let!(:beyonce) { Artist.create(:name => "Beyonce", :genre => "Pop", :photo_url => "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg") }

  it "can create a new artist" do
    visit new_artist_path
    fill_in "Name", with: "Kesha"
    fill_in "Genre", with: "garbage"
    fill_in "Photo url", with: "http://www.urbansplatter.com/wp-content/uploads/2013/11/Kesha-1880367.jpg"
    click_button("submit")

    expect(page).to have_content "Kesha"
  end

  it "can view an existing artist" do
    visit artist_path(beyonce)
    expect(page).to have_content "Beyonce"
  end

  it "can update an artist" do
    visit edit_artist_path(beyonce)
    fill_in "artist_name", with: "Queen Bey"
    click_button("submit")
    expect(page).to have_content "Queen Bey"
  end

  it "can destroy an artist" do
    visit artist_path(beyonce)
    click_button("destroy")
    expect(page).to_not have_content("Beyonce")
  end

end
