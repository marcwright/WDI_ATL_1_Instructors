require 'spec_helper'

describe "an admin can manage songs" do
   let!(:single_ladies) { Song.create(title: "Single Ladies", year: 2008)}

  it "can create a new song" do
    visit new_artist_song_path
    fill_in "song_name", with: "Drunk in Love"
    fill_in "song_year", with: 2013
    expect(page).to have_content "Drunk in Love"
  end

end
