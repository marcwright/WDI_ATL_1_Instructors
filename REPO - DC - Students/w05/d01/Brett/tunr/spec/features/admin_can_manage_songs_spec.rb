require 'spec_helper'

describe "Admin can manage songs" do
  let!(:kesha) { Artist.create( name: "Kesha", genre: "pop", photo_url: "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg") }
  let!(:tiktok) { kesha.songs.create( title: "Tik Tok", year: "2014") }

  it "can create a new song" do

    visit new_artist_song_path(kesha)
    fill_in "Title", with: "Tik Tok"
    fill_in "Year", with: 2014
    click_button("Submit")

    expect(page).to have_content "Tik Tok"
  end

  it "can delete a song" do
    visit artist_path(kesha)
    click_button("Delete song")
    expect(page).to_not have_content "Tik Tok"

  end

end
