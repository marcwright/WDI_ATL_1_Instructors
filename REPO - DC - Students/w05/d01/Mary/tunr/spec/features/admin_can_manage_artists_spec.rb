require 'spec_helper'

describe 'Admin can manage artists' do
  let!(:beyonce) { Artist.create(:name => "Beyonce", :genre =>"Pop", :photo_url =>"http://myclickurban.com/blog/wp-content/uploads/2013/12/Beyonce-Album-4-Outtake-beyonce-32623421-1280-960.jpg") }

  it "can create a new artist" do
    visit new_artist_path
    fill_in 'artist_name', with: 'Kesha'
    fill_in 'artist_genre', with: 'garbage'
    fill_in 'artist_photo_url', with: 'http://www.urbansplatter.com/wp-content/uploads/2013/11/Kesha.jpg'
    click_button('submit')
    expect( page ).to have_content 'Kesha'
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

  it "can delete an artist" do
    visit artist_path(beyonce)
    click_button("Delete")
    expect(page).to_not have_content("Beyonce")
  end

end #--describes "admin can manage users and songs"
