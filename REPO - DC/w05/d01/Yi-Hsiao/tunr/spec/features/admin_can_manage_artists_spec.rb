require "spec_helper"

describe "Admin can manage artists" do
  let!(:beyonce) do
    Artist.create(
      :name      => "Beyonce",
      :genre     => "Pop",
      :photo_url => "http://wac.450f.edgecastcdn.net/80450F/popcrush.com/files/2012/11/beyonce1.jpg"
    )
  end

  it "can create a new artist" do
    visit new_artist_path
    fill_in "artist_name",      :with => "Kesha"
    fill_in "artist_genre",     :with => "Pop"
    fill_in "artist_photo_url", :with => "http://wac.450f.edgecastcdn.net/80450F/popcrush.com/files/2012/11/kesha2.jpg"
    click_button "Add artist"

    expect(page).to have_text "Kesha"
  end

  it "can view an existing artist" do
    visit artist_path(beyonce)
    
    expect(page).to have_text "Beyonce"
  end

  it "can update an artist" do
    visit edit_artist_path(beyonce)
    fill_in "artist_name", with: "Queen Bey"
    click_button "Update artist"

    expect(page).to have_text "Queen Bey"
  end

  it "can destroy an artist" do
    visit artist_path(beyonce)
    click_button "Delete artist"

    expect(page).to have_no_text "Queen Bey"
  end
end