require 'spec_helper'


describe 'an admin can manage songs' do
    let(:wad) { Artist.create(:name => "Wad", :genre=> "noise-pop", :photo_url => "http://thesnivelinggoat.com/wp-content/uploads/2011/11/wad_of_paper.jpg")}
    let(:hotjamz) { Song.create(:year => "2014", :title => "Hot Jamz")}

  it 'can create a new song' do
    visit new_artist_song_path(wad)

    save_and_open_page
    fill_in "song_year", with: "2013"
    fill_in "song_title", with: "Warm Jamz"
    click_button('submit')
    expect(page).to have_content "Warm Jamz"
  end

end
