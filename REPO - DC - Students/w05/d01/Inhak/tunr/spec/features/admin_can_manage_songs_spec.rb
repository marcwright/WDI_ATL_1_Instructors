require "spec_helper"

describe "an admin can manage songs" do
  let!(:beyonce) { Artist.create(:name => "Beyonce", :genre => "pop", :photo_url => "http://www.eonline.com/eol_images/Entire_Site/2013719/rs_600x600-130819130517-600.BeyonceBob.mh.081913.jpg", :id => 76)}
  let!(:irreplaceable) { Song.create(:title => "Irreplaceable", :year => 2006, :artist_id => 76 ) }
  it "should create a song under artists" do
    visit artist_path(beyonce)
    expect(page).to have_content "Irreplaceable"
  end

  it "should create a song" do
    visit new_artist_song_path(beyonce)
    fill_in "song_title", with: "Single Ladies"
    fill_in "song_year", with: 2009
    click_button("add this song")
    expect(page).to have_content("Single Ladies")
  end

  it "can update a song" do
    visit edit_artist_song_path(beyonce, irreplaceable)
    fill_in "song_title", with: "Me, Myself, and I"
    click_button("submit")
    expect(page).to have_content("Me, Myself, and I")
  end

  it "can update through artist path" do
    visit artist_path(beyonce)
    click_link("edit")
    fill_in "song_title", with: "Single Ladies"
    click_button("submit")
    expect(page).to have_content("Single Ladies")
  end

  it "can destroy a song" do
    visit artist_path(beyonce)
    click_button("destroy song")
    expect(page).to_not have_content("Irreplaceable")
  end

  it "doesn't destroy the artist" do
    visit artist_path(beyonce)
    click_button("destroy song")
    expect(page).to have_content("Beyonce")
  end
end
