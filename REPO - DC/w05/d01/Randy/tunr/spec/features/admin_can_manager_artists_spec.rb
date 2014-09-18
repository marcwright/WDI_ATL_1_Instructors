require 'spec_helper'

describe 'admin can manage artists' do
  let!(:beyonce) {Artist.create(:name => "Beyonce", :genre => "Overrated", :photo_url => "http://pbs.twimg.com/media/BCsy8UGCAAECoLC.jpg:large")}

  it 'can create a new artist' do
    visit new_artist_path
    # save_and_open_page
    fill_in 'Name', with: 'Ke$ha'
    fill_in 'Genre', with: 'garbage'
    fill_in 'Photo url', with: 'http://www.urbansplatter.com/wp-content/uploads/2013/11/Kesha-1880367.jpg'
    click_button('submit')
    expect(page).to have_content 'Ke$ha'
  end

  it 'can view an existing artist' do
    visit artist_path(beyonce)
    expect(page).to have_content 'Beyonce'
  end
  it 'can update an artist' do
    visit edit_artist_path(beyonce)
    fill_in 'Name', with: 'Queen Bee'
    click_button('submit')
    expect(page).to have_content 'Queen Bee'
  end

  it 'can destroy an artist' do
    visit artist_path(beyonce)
    click_button('destroy')
    expect(page).to_not have_content('Beyonce')
  end

end
