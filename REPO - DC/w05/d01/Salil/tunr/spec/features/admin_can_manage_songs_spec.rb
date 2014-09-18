require "spec_helper"

describe "an admin can manage artists" do
  let!(:artist) { Artist.create(:name => "LCD Soundsystem", :genre => "Dance", :photo_url => "http://upload.wikimedia.org/wikipedia/commons/6/65/LCD_Soundsystem_-_Roskilde_Festival_2010.jpg")}
  let!(:song) {Song.create(:title => "All My Friends", :year => 2007, :artist_id => artist.id)}

  it "can create a song for an artists" do
    visit artists_path(artist)
    click_link("New Song")
    fill_in "song_title", with: "Dance Yrself Clean"
    fill_in "song_year", with: 2010
    click_button("submit")
    expect(page).to have_content "Dance Yrself Clean"
  end

  it "can view an existing artist" do
    visit artist_path(artist)
    expect(page).to have_content "All My Friends"
  end

  # it "can update an artist" do
  #   visit edit_artist_path(beyonce)
  #   # save_and_open_page
  #   fill_in "artist_name", with: "Queen Bey"
  #   click_button("submit")
  #   expect(page).to have_content "Queen Bey"
  # end

  # it "can destroy an artist" do
  #   visit artist_path(beyonce)
  #   click_button("destroy")
  #   expect(page).to_not have_content("Beyonce")
  # end

end
