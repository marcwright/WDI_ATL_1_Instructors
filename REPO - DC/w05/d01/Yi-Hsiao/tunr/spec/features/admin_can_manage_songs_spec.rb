require "spec_helper"

describe "Admin can manage songs" do
  let!(:kesha) do
    Artist.create(
      :name      => "Kesha",
      :genre     => "Pop",
      :photo_url => "http://wac.450f.edgecastcdn.net/80450F/popcrush.com/files/2012/11/kesha2.jpg"
    )
  end

  it "can create a song" do
    visit artist_path(kesha)
    click_link "Add song"
    fill_in "song_title", :with => "Timber"
    fill_in "song_year",  :with => "2013"
    click_button "Add song"

    expect(page).to have_text "Timber"
  end

  context "when there is a song" do
    let!(:right_round) do
      kesha.songs.create(
        :title => "Right Round",
        :year  => "2009",
      )
    end
    before { kesha }

    it "can update a song" do
      visit artist_path(kesha)
      click_link "edit_song_#{ right_round.id }"
      fill_in "song_title", :with => "Left Square"
      click_button "Update song"

      expect(page).to have_text "Left Square"
    end

    it "can delete a song" do
      visit artist_path(kesha)
      click_button "delete_song_#{ right_round.id }"

      expect(page).to have_no_text "Left Square"
    end
  end
end