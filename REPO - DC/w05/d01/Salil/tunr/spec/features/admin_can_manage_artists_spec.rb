require "spec_helper"

describe "an admin can manage artists" do
  let!(:beyonce) { Artist.create(:name => "Beyonce", :genre => "Pop", :photo_url => "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg")}

  it "can create a new artist" do
    visit new_artist_path
    fill_in "artist_name", with: "LCD Soundsystem"
    fill_in "artist_genre", with: "alternative dance"
    fill_in "artist_photo_url", with: "http://upload.wikimedia.org/wikipedia/commons/6/65/LCD_Soundsystem_-_Roskilde_Festival_2010.jpg"
    click_button("submit")
    expect(page).to have_content "LCD Soundsystem"
  end

  it "can view an existing artist" do
    visit artist_path(beyonce)
    expect(page).to have_content "Beyonce"
  end

  it "can update an artist" do
    visit edit_artist_path(beyonce)
    # save_and_open_page
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
