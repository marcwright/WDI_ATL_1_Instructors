require 'spec_helper'

describe 'admin can manage artists' do
  let!(:beyonce) {Artist.create(:name => "Beyonce", :genre => "Overrated", :photo_url => "http://pbs.twimg.com/media/BCsy8UGCAAECoLC.jpg:large")}
  let!(:halo) {Song.create(:name => "Halo", :year => "2008", :artist_id => beyonce.id)}

  it 'means an artist has a song' do
    visit artist_path(beyonce)
    expect(page).to have_content 'Halo'
  end

  it 'can create a new song' do
      visit artist_path(beyonce)
      click_link('New Song')
      # save_and_open_page
      fill_in 'Name', with: 'Single Ladies'
      fill_in 'Year', with: '1487'
      click_button('submit')
      expect(page).to have_content 'Single Ladies'
    end

  it 'can edit a  song' do
    visit artist_path(beyonce)
    save_and_open_page
    click_link('Halo')
    # save_and_open_page
    fill_in 'Name', with: 'Banana'
    fill_in 'Year', with: '1487'
    click_button('submit')
    expect(page).to have_content 'Banana'
  end

  it 'can delete songs' do
    visit artist_path(beyonce)
    click_button('Delete')
    expect(page).to_not have_content('Halo')
  end


end
