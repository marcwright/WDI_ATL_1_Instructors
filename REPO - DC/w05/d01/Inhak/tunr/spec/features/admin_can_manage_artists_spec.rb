require 'spec_helper'

describe 'an admin can manage artists' do
  let!(:beyonce) { Artist.create(:name => "Beyonce", :genre => "pop", :photo_url => "http://www.eonline.com/eol_images/Entire_Site/2013719/rs_600x600-130819130517-600.BeyonceBob.mh.081913.jpg")}

  it 'can create a new artist' do
    visit new_artist_path
    fill_in 'artist_name', with: 'Kesha'
    fill_in 'artist_genre', with: 'garbage'
    fill_in 'artist_photo_url', with: 'http://www.newsrevealer.com/wp-content/uploads/2014/03/kesha-Funky-Medium-Hairstyles.jpg'
    click_button('submit')
    expect(page).to have_content 'Kesha'
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

  it "can destroy an artist" do
    visit artist_path(beyonce)
    click_button("destroy")
    expect(page).to_not have_content("Beyonce")
  end
end
