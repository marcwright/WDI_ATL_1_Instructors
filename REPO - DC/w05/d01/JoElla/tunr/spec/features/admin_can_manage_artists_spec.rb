require 'spec_helper'

describe 'an admin can manage artists' do
  let(:beyonce) { Artist.create(:name => "Beyonce", :genre=> 'pop', :photo_url => "http://thenypost.files.wordpress.com/2014/01/beyonce4.jpg")}

  it 'can create a new artist' do
    visit new_artist_path

    fill_in 'Name', with: 'Kesha'
    fill_in 'Genre', with: 'garbage'
    fill_in 'artist_photo_url', with: 'http://grist.files.wordpress.com/2009/10/puppies2.jpg'
    click_button('submit')
    expect(page).to have_content 'Kesha'
  end

  it 'can view an existing artist' do
    visit artist_path(beyonce)
    expect(page).to have_content "Beyonce"
  end

  it "can update an artist" do
    visit edit_artist_path(beyonce)
    fill_in "artist_name", with: "Bey"
    click_button("submit")
    expect(page).to have_content "Bey"
  end

  it "can destroy an artist" do
    visit artist_path(beyonce)
    click_button("destroy")
    expect(page).to_not have_content("Beyonce")
  end

end
