require 'spec_helper'

describe 'an admin can manage songs' do
  let!(:beyonce) { Artist.create(:name => "Beyonce", :genre => "Pop", :photo_url => "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg")}
  let!(:crazy) {Song.create(:title => "Crazy in Love", :year => 2003, :artist_id => beyonce.id)}

  it 'can create a new song' do
    visit new_artist_song_path(beyonce)
    save_and_open_page
    fill_in 'song_title', with: 'Baby Boy'
    fill_in 'song_year', with: 2003
    click_button('submit')
    expect(page).to have_content
  end

  it 'can update a song' do
    visit edit_artist_song_path(beyonce)
    fill_in 'song_title', with: 'Halo'
    fill_in 'song_year', with: 2008
    click_button('edit')
    expect(page).to have_content 'Halo'
  end
end
