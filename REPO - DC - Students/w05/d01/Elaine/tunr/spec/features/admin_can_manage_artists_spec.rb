require 'spec_helper'

describe 'an admin can manage artists' do
  let!(:beyonce) { Artist.create(:name => "Beyonce", :genre => "Pop", :photo_url => "https://cms.myspacecdn.com/cms/x/13/36/090413-beyonce-600.jpg") }

  it 'can create a new artist' do
    visit new_artist_path
    save_and_open_page
    fill_in 'artist_name', with: 'Kesha'
    fill_in 'artist_genre', with: 'garbage'
    fill_in 'artist_photo_url', with: 'http://www.urbansplatter.com/wp-content/uploads/2013/11/Kesha+Calzedonia+Summer+Show+Forever+Together+px6o46IO55Vl.jpg'
    click_button('submit')
    expect(page).to have_content 'Kesha'
  end

  it 'can view an existing artist' do
    visit artist_path(beyonce)
    expect(page).to have_content "Beyonce"
  end

  it 'can update an artist' do
    visit edit_artist_path(beyonce)
    fill_in "artist_name", with: "Queen Bey"
    click_button("submit")
    expect(page).to have_content "Queen Bey"
  end

  it 'can destroy an artist' do
    visit artist_path(beyonce)
    click_button("destroy")
    expect(page).to_not have_content("Beyonce")
  end

end
