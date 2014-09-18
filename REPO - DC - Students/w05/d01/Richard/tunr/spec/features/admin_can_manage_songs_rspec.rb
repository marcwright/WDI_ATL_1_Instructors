require 'spec_helper'

describe 'an admin can manage songs' do

  let!(:beyonce) { Artist.create(:id => 1, :name => "Beyonce", :genre => "Pop", :photo_url => "http://i2.cdn.turner.com/cnn/dam/assets/131213113831-03-beyonce-horizontal-gallery.jpg")}

  let!(:irreplaceable) { Song.create(:title => "irreplaceable", :year => 2006, :artist_id => 1)}

  it "allows an artist to have a song" do
    visit artist_path(beyonce)
    expect(page).to have_content 'irreplaceable'
  end

  it "can add a song to an artist" do
    visit artist_path(beyonce)
    click_link('add song')
    fill_in 'Title', with: 'Single Ladies'
    click_button('submit')
    expect(page).to have_content 'Single Ladies'
  end

  it "can update a song to an artist" do
    visit artist_path(beyonce)
    click_link('edit song')
    fill_in 'Title', with: 'Derp'
    fill_in 'Year', with: 2010
    click_button('submit')
    expect(page).to have_content 'Derp'
  end

  it "can delete a song from the artists page" do
    visit artist_path(beyonce)
    click_button('Remove Song')
    expect(page).to_not have_content 'irreplaceable'
  end
end

    # save_and_open_page
