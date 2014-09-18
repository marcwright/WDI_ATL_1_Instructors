require 'spec_helper'

describe 'Admin can manage songs from Artist-page; and...' do
  let!(:beyonce) {Artist.create(:name => 'Beyonce', :genre => 'Pop', :photo_url => 'http://www.digitaltrends.com/wp-content/uploads/2013/12/beyonce.jpeg')}
  #let!(:crazy) {Song.create(:title => 'Crazy in Love', :year => '2009', :artist_id => '0')}

  it 'can create a new song' do
    visit artist_path(beyonce)
    click_button("add a song:")
    fill_in 'title', with: 'I love you'
    fill_in 'year', with: '1997'
    save_and_open_page
    click_button('add song')
    expect(page).to have_content 'I love you'
  end

  #it 'can view an existing artist' do
  #  visit artist_path(beyonce)
  #  expect(page).to have_content "Beyonce"
  #end
#
#
  #it "can update an artist" do
  #  visit edit_artist_path(beyonce)
  #  fill_in "artist_name", with: "Queen Bey"
  #  click_button("edit artist")
  #  expect(page).to have_content 'Queen Bey'
  #end
#
  #it "can destroy an exisiting artist entry" do
  #  visit artist_path(beyonce)
  #  click_button("destroy")
  #  expect(page).to_not have_content("Beyonce")
  #end

end
