require "spec_helper"

describe "an admin can manage songs" do
  let!(:song) { Song.create(:title => "Crazy in Love", :year => "2009") }

  it "can create a new song" do
    visit new_artist_songs_path
    fill_in "song_title", with: "Crazy in Love"
    fill_in "song_year", with: "2009"
    click_button("submit")
    expect(page).to have_content "Crazy in Love"
  end


end
