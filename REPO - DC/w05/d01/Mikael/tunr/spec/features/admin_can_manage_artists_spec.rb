require "spec_helper"

describe "an admin can manage artists" do
  let!(:beyonce) { Artist.create(name: "Beyonce", genre: "Pop", photo_url: "http://airows.com/wp-content/uploads/2013/04/BeyonceHMSummer3.jpg")}

  it "can create a new artist" do
    visit new_artist_path

    fill_in "artist_name", with: "CyHi the Prynce"
    fill_in "artist_genre", with: "hip hop"
    fill_in "artist_photo_url", with: "http://streetkhemistry.com/wp-content/uploads/2014/03/uKQjYHGS.jpeg"
    click_button("Submit")
    expect(page).to have_content "CyHi the Prynce"
  end

  it "can view an existing artist" do
    visit artist_path(beyonce)
    expect(page).to have_content "Beyonce"
  end

  it "can update an artist" do
    visit edit_artist_path(beyonce)
    fill_in "artist_name", with: "Queen Bey"
    click_button("create")
    expect(page).to have_content "Queen Bey"
  end

  it "can destroy an artist" do
    visit artist_path(beyonce)
    click_button("destroy")
    expect(page).to_not have_content("Beyonce")
  end
end
