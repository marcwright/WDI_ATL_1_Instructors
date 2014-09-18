require 'spec_helper'

describe 'user can manage artists' do
  let!(:beyonce) {Artist.create(:name => 'Beyonce', :genre => 'Pop', :photo_url => 'http://www.digitaltrends.com/wp-content/uploads/2013/12/beyonce.jpeg')}

  it 'can create a new artist' do
    visit new_artist_path
    fill_in 'artist_name', with: 'Kesha'
    fill_in 'artist_genre', with: 'indie rock'
    fill_in 'artist_photo_url', with: 'http://www.osovo.com/images/kesha/kesha-08.jpg'
    save_and_open_page
    click_button('add artist')
    expect(page).to have_content 'Kesha'
  end

  it 'can view an existing artist' do
    visit artist_path(beyonce)
    expect(page).to have_content "Beyonce"
  end


  it "can update an artist" do
    visit edit_artist_path(beyonce)
    fill_in "artist_name", with: "Queen Bey"
    click_button("edit artist")
    expect(page).to have_content 'Queen Bey'
  end

  it "can destroy an exisiting artist entry" do
    visit artist_path(beyonce)
    click_button("destroy")
    expect(page).to_not have_content("Beyonce")
  end

end
